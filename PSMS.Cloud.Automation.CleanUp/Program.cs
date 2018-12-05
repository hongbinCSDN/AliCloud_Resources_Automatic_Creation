using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSMS.Cloud.Common;
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Ecs.Model.V20140526;
using Aliyun.Acs.Alidns.Model.V20150109;
using Aliyun.Acs.Rds.Model.V20140815;
using Aliyun.Acs.Slb.Model.V20140515;

namespace PSMS.Cloud.Automation.CleanUp
{
    static class Program
    {
        static void Main(string[] args)
        {

            ProcessFullyExpiredRecord();
            RemoveExpiredWFEFromSLBAndDBWL(0);

        }


        private static void ProcessFullyExpiredRecord()
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            int dayBeforeRelease = int.Parse(CommonConfig.GetParam("DayBeforeRelease"));

            SqlHelper.AddSqlParam(ref param, SqlDbType.Int, "@DayBeforeRelease", dayBeforeRelease);

            DataTable dtPaymentMasterRecords = da.RunProcDT("AUTOMATION_CLEANUP_GetExpiredPaymentRecord", param);

            if (dtPaymentMasterRecords.Rows.Count > 0)
            {

                foreach (DataRow drPaymentMaster in dtPaymentMasterRecords.Rows)
                {
                    long paymentMasterID = (long)drPaymentMaster["RECORD_ID"];

                    ProcessWFERecord(paymentMasterID);
                    ProcessDNSRecord(paymentMasterID);
                    ProcessSLBRecord(paymentMasterID);

                    // to do: update WFE records to inactive

                    ProcessRecordHelper helper = new ProcessRecordHelper();
                    helper.UpdatePaymentMasterStatusCode(paymentMasterID, "RELEASED");
                }

            }
        }



        private static void RemoveExpiredWFEFromSLBAndDBWL(long paymentMasterID)
        {
            DataAccess da = new DataAccess();

            DataTable dtWFERecords;

            if (paymentMasterID == 0)
                dtWFERecords = da.RunProcDT("AUTOMATION_CLEANUP_GetRequirePartialCleanupWFERecord");
            else
            {
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                dtWFERecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);
            }

            if (dtWFERecords.Rows.Count > 0)
            {
                foreach (DataRow drWFERecord in dtWFERecords.Rows)
                {
                    paymentMasterID = (long)drWFERecord["PAYMENT_MASTER_ID"];
                    long recordID = (long)drWFERecord["RECORD_ID"];
                    string vmInstanceID = drWFERecord["VM_INSTANCE_ID"].ToString();
                    long slbMasterID = (long)drWFERecord["SLB_MASTER_ID"];
                    string vmIP = drWFERecord["VM_IP"].ToString();

                    da = new DataAccess();
                    List<SqlParameter> param = new List<SqlParameter>();
                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);
                    DataTable dtSLBRecords = da.RunProcDT("AUTOMATION_SLB_GetRecordByRecordID", param);
                    if (dtSLBRecords.Rows.Count == 1)
                    {
                        DataRow drSLBRecord = dtSLBRecords.Rows[0];
                        string slbInstanceID = drSLBRecord["SLB_INSTANCE_ID"].ToString();


                        string serverList = "[\"" + vmInstanceID + "\"]";


                        // remove WFE from SLB
                        string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                        string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                        string regionID = CommonConfig.GetParam("RegionID");

                        IClientProfile profile = DefaultProfile.GetProfile(
                            regionID,
                            accessKeyID,
                            accessKeySecret);
                        DefaultAcsClient client = new DefaultAcsClient(profile);

                        RemoveBackendServersRequest rbsReq = new RemoveBackendServersRequest();
                        rbsReq.LoadBalancerId = slbInstanceID;
                        rbsReq.BackendServers = serverList;

                        try
                        {
                            RemoveBackendServersResponse rbsResp = client.GetAcsResponse(rbsReq);

                            if (!string.IsNullOrEmpty(rbsResp.RequestId))
                            {
                                // update WFE Master table
                                da = new DataAccess();

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", recordID);

                                da.RunProc("AUTOMATION_CLEANUP_UpdateWFEDeleteStatus", param);


                                // remove VM IP from DB whitelist

                                da = new DataAccess();

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                                DataTable dtDBInst = da.RunProcDT("AUTOMATION_DBINST_GetRecordByPaymentMasterID", param);

                                if (dtDBInst.Rows.Count == 1)
                                {
                                    DataRow drDBInst = dtDBInst.Rows[0];

                                    long dbInstRecordID = (long)drDBInst["RECORD_ID"];
                                    string dbInstanceID = drDBInst["DB_INSTANCE_ID"].ToString();
                                    string whitelist = drDBInst["WHITELIST"].ToString();
                                    string updatedWhitelist = whitelist.Replace(vmIP, "").Replace(",,", ",").TrimEnd(',');

                                    ModifySecurityIpsRequest msipReq = new ModifySecurityIpsRequest();
                                    msipReq.DBInstanceId = dbInstanceID;
                                    msipReq.SecurityIps = updatedWhitelist;
                                    msipReq.ModifyMode = "Cover";

                                    ModifySecurityIpsResponse msipResp = client.GetAcsResponse(msipReq);

                                    if (!string.IsNullOrEmpty(msipResp.TaskId))
                                    {
                                        da = new DataAccess();

                                        param = new List<SqlParameter>();

                                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dbInstRecordID);

                                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@Whitelist", updatedWhitelist);

                                        da.RunProc("AUTOMATION_DBINST_UpdateWhitelistByRecordID", param);
                                    }
                                }

                                
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.ToString());
                        }
                    }
                }
            }
        }

        private static void ProcessWFERecord(long paymentMasterID)
        {
            // get WFE record
            DataAccess da = new DataAccess();

            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            DataTable dtWFERecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

            if (dtWFERecords.Rows.Count > 0)
            {
                foreach (DataRow dr in dtWFERecords.Rows)
                {
                    long recordID = (long)dr["RECORD_ID"];

                    da = new DataAccess();

                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", recordID);

                    da.RunProc("AUTOMATION_WFE_SetToInactive", param);
                }
            }

            RemoveExpiredWFEFromSLBAndDBWL(paymentMasterID);

        }

        private static void ProcessSLBRecord(long paymentMasterID)
        {
            // get SLB record
            DataAccess da = new DataAccess();

            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);


            DataTable dtSLBRecords = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

            if (dtSLBRecords.Rows.Count > 0)
            {
                foreach (DataRow drSLB in dtSLBRecords.Rows)
                {
                    bool isActive = (bool)drSLB["IS_ACTIVE"];
                    long slbRecordID = (long)drSLB["RECORD_ID"];

                    if (isActive)
                    {
                        string slbInstanceID = drSLB["SLB_INSTANCE_ID"].ToString();

                        // delete record from alicloud
                        string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                        string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                        string regionID = CommonConfig.GetParam("RegionID");

                        IClientProfile profile = DefaultProfile.GetProfile(
                            regionID,
                            accessKeyID,
                            accessKeySecret);
                        DefaultAcsClient client = new DefaultAcsClient(profile);

                        DeleteLoadBalancerRequest delReq = new DeleteLoadBalancerRequest();
                        delReq.LoadBalancerId = slbInstanceID;

                        DeleteLoadBalancerResponse delResp = client.GetAcsResponse(delReq);

                        if (delResp.RequestId != null)
                        {
                            da = new DataAccess();

                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbRecordID);

                            da.RunProc("AUTOMATION_CLEANUP_InactiveAndUpdateSLBDeleteStatus", param);
                        }
                    }
                }
            }

        }

        private static void ProcessDNSRecord(long paymentMasterID)
        {
            // get DNS record
            DataAccess da = new DataAccess();

            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);


            DataTable dtDNSRecords = da.RunProcDT("AUTOMATION_DNS_GetRecordByPaymentMasterID", param);

            if (dtDNSRecords.Rows.Count > 0)
            {
                foreach (DataRow drDNS in dtDNSRecords.Rows)
                {
                    bool isActive = (bool)drDNS["IS_ACTIVE"];
                    long dnsRecordID = (long)drDNS["RECORD_ID"];

                    if (isActive)
                    {
                        string subdomain = drDNS["SUBDOMAIN"].ToString();


                        // delete record from alicloud
                        string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                        string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                        string regionID = CommonConfig.GetParam("RegionID");
                        string domainName = CommonConfig.GetParam("DomainName");
                        string recordType = CommonConfig.GetParam("RecordType");

                        IClientProfile profile = DefaultProfile.GetProfile(
                            regionID,
                            accessKeyID,
                            accessKeySecret);
                        DefaultAcsClient client = new DefaultAcsClient(profile);

                        DescribeDomainRecordsRequest desReq = new DescribeDomainRecordsRequest();
                        desReq.DomainName = domainName;
                        desReq.PageSize = 20;
                        desReq.RRKeyWord = subdomain;
                        desReq.TypeKeyWord = recordType;

                        DescribeDomainRecordsResponse desResp = client.GetAcsResponse(desReq);

                        string dnsRecordIDStr = "";

                        if (!(string.IsNullOrEmpty(desResp.RequestId)))
                        {
                            if (desResp.DomainRecords != null)
                            {
                                List<DescribeDomainRecordsResponse.Record> desRespRec = desResp.DomainRecords;

                                foreach (DescribeDomainRecordsResponse.Record rec in desRespRec)
                                {
                                    if (rec.RR.ToUpper() == subdomain.ToUpper())
                                    {
                                        dnsRecordIDStr = rec.RecordId;
                                        break;
                                    }
                                }
                            }
                        }

                        if (!string.IsNullOrEmpty(dnsRecordIDStr))
                        {
                            client = new DefaultAcsClient(profile);

                            DeleteDomainRecordRequest delReq = new DeleteDomainRecordRequest();
                            delReq.RecordId = dnsRecordIDStr;


                            DeleteDomainRecordResponse delResp = client.GetAcsResponse(delReq);

                            if (delResp.RecordId != null)
                            {
                                // update DNS record "DELETED" field
                                da = new DataAccess();

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dnsRecordID);

                                da.RunProc("AUTOMATION_CLEANUP_InactiveAndUpdateDNSDeleteStatus", param);
                            }

                        }

                    }
                }
            }
        }
    }
}

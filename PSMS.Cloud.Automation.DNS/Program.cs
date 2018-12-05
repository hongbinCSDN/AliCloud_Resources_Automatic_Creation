using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSMS.Cloud.Common;
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Alidns.Model.V20150109;

namespace PSMS.Cloud.Automation.DNS
{
    static class Program
    {
        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-DNS", false));
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-DNS"));

            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessRenewRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-DNS", false), "RN|CP-DNS");
            ProcessRenewRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-DNS"), "RN|CP-DNS");
        }


        private static void ProcessRenewRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                // check if DB Master already has new record
                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtNewDNSMasterRecord = da.RunProcDT("AUTOMATION_DNS_GetRecordByPaymentMasterID", param);

                if (dtNewDNSMasterRecord.Rows.Count == 0)
                {
                    // not exist, create new record

                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                    DataTable dtNewPaymentMasterRecord = da.RunProcDT("AUTOMATION_PM_GetRecordByPaymentMasterID", param);
                    if (dtNewPaymentMasterRecord.Rows.Count == 1)
                    {

                        DataRow drNewPaymentMasterRecord = dtNewPaymentMasterRecord.Rows[0];
                        string renewalLastOrderRef = drNewPaymentMasterRecord["RENEWAL_LAST_ORDERREF"].ToString();

                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@LastOrderRef", renewalLastOrderRef);

                        DataTable dtOldPaymentMasterRecord = da.RunProcDT("AUTOMATION_PM_GetLastOrderRecord", param);

                        if (dtOldPaymentMasterRecord.Rows.Count == 1)
                        {
                            DataRow drOldPaymentMasterRecord = dtOldPaymentMasterRecord.Rows[0];

                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", (long)drOldPaymentMasterRecord["RECORD_ID"]);

                            DataTable dtOldDNSMasterRecord = da.RunProcDT("AUTOMATION_DNS_GetRecordByPaymentMasterID", param);

                            if (dtOldDNSMasterRecord.Rows.Count == 1)
                            {
                                DataRow drOldDNSMasterRecord = dtOldDNSMasterRecord.Rows[0];

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldDNSMasterID", (long)drOldDNSMasterRecord["RECORD_ID"]);

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", paymentMasterID);

                                da.RunProc("[AUTOMATION_RENEW_DuplicateDNSRecord]", param);
                            }
                        }
                    }
                }

                ProcessRecordHelper prHelper = new ProcessRecordHelper();
                prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
            }
        }


        private static void ProcessInProgressRecord(List<long> paymentMasterIDs)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {

                // check if record already exist in DNS Master table
                long dnsMasterID = 0;
                string subdomain = "";
                string dnsIP = "";

                DataAccess da = new DataAccess();
                List<SqlParameter> param;

                // get IP from SLB table

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtSLBMasterRecords = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

                DataRow drSLBMasterRecord = dtSLBMasterRecords.Rows[0];
                dnsIP = drSLBMasterRecord["INTERNET_IP"].ToString();

                // check if found in DNS Master

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtDNSMasterRecords = da.RunProcDT("AUTOMATION_DNS_GetRecordByPaymentMasterID", param);

                if (dtDNSMasterRecords.Rows.Count == 0)
                {
                    // not exist

                    // get subdomain from subscription table
                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                    DataTable dtPaymentMasterRecords = da.RunProcDT("AUTOMATION_PM_GetRecordByPaymentMasterID", param);

                    if (dtPaymentMasterRecords.Rows.Count == 1)
                    {
                        DataRow drPaymentMasterRecord = dtPaymentMasterRecords.Rows[0];
                        subdomain = drPaymentMasterRecord["DOMAIN_NAME"].ToString();



                        //add record to DNS Master table

                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@Subdomain", subdomain);

                        dnsMasterID = da.RunProcReturnLongIdentity("AUTOMATION_DNS_AddNewRecord", param);

                        // create DNS record
                        CreateDNSInstance(paymentMasterID, dnsMasterID, subdomain, dnsIP);
                    }

                }
                else if (dtDNSMasterRecords.Rows.Count == 1)
                {
                    DataRow drDNSMasterRecord = dtDNSMasterRecords.Rows[0];

                    dnsMasterID = (long)drDNSMasterRecord["RECORD_ID"];

                    subdomain = drDNSMasterRecord["SUBDOMAIN"].ToString();

                    CreateDNSInstance(paymentMasterID, dnsMasterID, subdomain, dnsIP);
                }

            }
        }


        private static void CreateDNSInstance(long paymentMasterID, long dnsMasterID, string subDomain, string dnsIP)
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                string domainName = CommonConfig.GetParam("DomainName");
                string recordType = CommonConfig.GetParam("RecordType");
                string ttl = CommonConfig.GetParam("TTL");

                // Create a client used for initiating a request
                IClientProfile profile = DefaultProfile.GetProfile(
                    regionID,
                    accessKeyID,
                    accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);
                
                AddDomainRecordRequest req = new AddDomainRecordRequest();
                req.DomainName = domainName;
                req.RR = subDomain;
                req.Type = recordType;
                req.Value = dnsIP;
                req.TTL = long.Parse(ttl);


                AddDomainRecordResponse adrResp = client.GetAcsResponse(req);


                if (!(string.IsNullOrEmpty(adrResp.RecordId)))
                {
                    // update DNS Master
                    DataAccess da = new DataAccess();
                    List<SqlParameter> param;

                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dnsMasterID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@DNSIP", dnsIP);

                    da.RunProc("AUTOMATION_DNS_UpdateDNSIP", param);


                    // update cloud resource master to CP-DNS
                    ProcessRecordHelper prHelper = new ProcessRecordHelper();
                    prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, "CP-DNS");
                }

            }
            catch (ServerException ex)
            {
                System.Console.WriteLine(ex.ToString());
            }
            catch (ClientException ex)
            {
                System.Console.WriteLine(ex.ToString());
            }
        }


    }
}

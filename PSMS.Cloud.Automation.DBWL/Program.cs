using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Rds.Model.V20140815;
using PSMS.Cloud.Common;

namespace PSMS.Cloud.Automation.DBWL
{
    static class Program
    {
        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-DBWL", false), "CP-DBWL");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-DBWL"), "CP-DBWL");

            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-DBWL", false), "RN|CP-DBWL");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-DBWL"), "RN|CP-DBWL");
        }


        private static void ProcessInProgressRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                // check if record already exist in WFE Master table
                DataAccess da = new DataAccess();
                List<SqlParameter> param;

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtWFEMasterRecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

                foreach (DataRow drWFEMasterRecord in dtWFEMasterRecords.Rows)
                {

                    if ((drWFEMasterRecord["VM_IP"] != DBNull.Value) && (drWFEMasterRecord["VM_STATUS"] != DBNull.Value))
                    {
                        long relatedPaymentMasterID = (long)drWFEMasterRecord["PAYMENT_MASTER_ID"];
                        string vmStatus = drWFEMasterRecord["VM_STATUS"].ToString();
                        string vmIP = drWFEMasterRecord["VM_IP"].ToString();
                        bool configFileUpdated = (bool)drWFEMasterRecord["CONFIG_FILE_UPDATED"];

                        // case when VM already running and web.config file not updated
                        if ((vmStatus == "Running") && (!configFileUpdated))
                        {
                            SetWhitelist(relatedPaymentMasterID, vmIP, processCompleteStatusCode);
                        }
                    }

                }


                // final check on all WFE's whitelist status. If all ready, update payment master status code
                VerifyDBInstanceWhitelistRecordStatus(paymentMasterID, processCompleteStatusCode);

            }
        }


        private static void VerifyDBInstanceWhitelistRecordStatus(long paymentMasterID, string processCompleteStatusCode)
        {
            bool allWFEReady = true;
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            DataTable dtDBInstanceMasterRecord = da.RunProcDT("AUTOMATION_DBINST_GetRecordByPaymentMasterID", param);

            if (dtDBInstanceMasterRecord.Rows.Count == 1)
            {
                DataRow drDBInstanceMasterRecord = dtDBInstanceMasterRecord.Rows[0];
                string whitelist = drDBInstanceMasterRecord["WHITELIST"].ToString();

                // get all related WFE
                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtWFEMasterRecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

                foreach (DataRow drWFEMasterRecord in dtWFEMasterRecords.Rows)
                {
                    string vmIP = drWFEMasterRecord["VM_IP"].ToString();
                    if (whitelist.IndexOf(vmIP)<0)
                    {
                        allWFEReady = false;
                        break;
                    }
                }

            }

           

            if (allWFEReady)
            {
                ProcessRecordHelper prHelper = new ProcessRecordHelper();
                prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
            }
        }

        private static void SetWhitelist(long paymentMasterID, string vmIP, string processCompleteStatusCode)
        {
            try
            {
                

                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtResult = da.RunProcDT("AUTOMATION_DBINST_GetRecordByPaymentMasterID", param);

                if (dtResult.Rows.Count == 1)
                {
                    DataRow drResult = dtResult.Rows[0];
                    string dbInstanceID = drResult["DB_INSTANCE_ID"].ToString();
                    long recordID = (long)drResult["RECORD_ID"];
                    string whitelistInDB = "";
                    if (drResult["WHITELIST"] != DBNull.Value)
                        whitelistInDB = drResult["WHITELIST"].ToString();

                    string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                    string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                    string regionID = CommonConfig.GetParam("RegionID");

                    

                    // Create a client used for initiating a request
                    IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                    DefaultAcsClient client = new DefaultAcsClient(profile);

                    DescribeDBInstanceIPArrayListRequest ddbipalReq = new DescribeDBInstanceIPArrayListRequest();
                    ddbipalReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;
                    ddbipalReq.DBInstanceId = dbInstanceID;

                    DescribeDBInstanceIPArrayListResponse ddbipalResp = client.GetAcsResponse(ddbipalReq);
                    

                    if (ddbipalResp.Items.Count != 0)
                    {
                        string whitelistOnCloud = "";

                        foreach (var item in ddbipalResp.Items)
                        {
                            whitelistOnCloud = whitelistOnCloud + item.SecurityIPList + ",";
                        }

                        whitelistOnCloud = whitelistOnCloud.TrimEnd(',');

                        if (whitelistOnCloud.IndexOf(vmIP)<0)
                        {
                            // add to whitelist if IP not found
                            whitelistOnCloud = whitelistOnCloud + "," + vmIP;

                            // send request to add IP to whitelist
                            ModifySecurityIpsRequest msipReq = new ModifySecurityIpsRequest();
                            msipReq.DBInstanceId = dbInstanceID;
                            msipReq.SecurityIps = whitelistOnCloud;

                            ModifySecurityIpsResponse msipResp = client.GetAcsResponse(msipReq);

                            if (!string.IsNullOrEmpty(msipResp.TaskId))
                            {
                                // resend check whitelist request to check if IP added
                                DescribeDBInstanceIPArrayListRequest ddbipalResendReq = new DescribeDBInstanceIPArrayListRequest();
                                ddbipalResendReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;
                                ddbipalResendReq.DBInstanceId = dbInstanceID;

                                DescribeDBInstanceIPArrayListResponse ddbipalResendResp = client.GetAcsResponse(ddbipalResendReq);



                                if (ddbipalResendResp.Items.Count != 0)
                                {
                                    string whitelistCheck = "";

                                    foreach (var item in ddbipalResendResp.Items)
                                    {
                                        whitelistCheck = whitelistCheck + item.SecurityIPList + ",";
                                    }

                                    whitelistCheck = whitelistCheck.TrimEnd(',');

                                    if (whitelistCheck.IndexOf(vmIP) >= 0)
                                    {
                                        // found in updated whitelist. update DB Instance Master record
                                        param = new List<SqlParameter>();

                                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", recordID);

                                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@Whitelist", whitelistOnCloud);

                                        da.RunProc("AUTOMATION_DBINST_UpdateWhitelistByRecordID", param);

                                        // update payment master status_code

                                        ProcessRecordHelper helper = new ProcessRecordHelper();
                                        helper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
                                        
                                    }
                                    else
                                    {
                                        // not found. Ignore this run and resume upon next run
                                    }
                                }

                            }
                        }
                        else
                        {
                            
                            if (whitelistInDB.IndexOf(vmIP) >= 0)
                            {
                                // found on cloud, found in local DB
                                // do nothing
                            }
                            else
                            {
                                // found on cloud, not found in local DB
                                // update DB Instance Master record
                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", recordID);

                                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@Whitelist", whitelistOnCloud);

                                da.RunProc("AUTOMATION_DBINST_UpdateWhitelistByRecordID", param);

                            }

                        }
                    }
                    

                }



            }
            catch (ServerException ex)
            {
                Console.WriteLine(ex.ToString());
            }
            catch (ClientException ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }
    }
}

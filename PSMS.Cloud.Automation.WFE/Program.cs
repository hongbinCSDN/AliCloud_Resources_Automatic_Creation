using System;
using System.Collections.Generic;
using System.Configuration;
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


namespace PSMS.Cloud.Automation.WFE
{
    static class Program
    {
        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-WFE", false), "CP-WFE");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-WFE"), "CP-WFE");

            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessRenewRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-WFE", false), "RN|CP-WFE");
            ProcessRenewRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-WFE"), "RN|CP-WFE");
            
        }

        private static void ProcessRenewRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", paymentMasterID);

                DataTable dtRenewRecords = da.RunProcDT("AUTOMATION_RENEW_GetRecordByNewPaymentMasterID", param);
                foreach (DataRow drRenewRecord in dtRenewRecords.Rows)
                {
                    if (drRenewRecord["RENEW_ACTION"].ToString() == "COPY_DB_RECORD" &&
                        drRenewRecord["RENEW_STATUS_CODE"].ToString() == "CP-WFE" &&
                        drRenewRecord["NEW_WFE_MASTER_ID"] == DBNull.Value)
                    {
                        // duplicate old WFE_MASTER record and update PAYMENT_MASTER_ID, set old record to inactive, update RENEW MASTER
                        param = new List<SqlParameter>();

                        long oldWFEMasterID = (long)drRenewRecord["OLD_WFE_MASTER_ID"];

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldWFEMasterID", oldWFEMasterID);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", paymentMasterID);

                        da.RunProc("AUTOMATION_RENEW_DuplicateWFERecord", param);

                    }
                    else if (drRenewRecord["RENEW_ACTION"].ToString() == "CREATE_INSTANCE" &&
                             drRenewRecord["RENEW_STATUS_CODE"].ToString() != "CP-WFE" &&
                             drRenewRecord["NEW_WFE_MASTER_ID"] == DBNull.Value)
                    {
                        // insert record to WFE MASTER
                        long newWFEMasterID = InsertNewWFEMasterRecord(paymentMasterID);

                        // update NEW_WFE_MASTER_ID
                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", (long)drRenewRecord["RECORD_ID"]);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewWFEMasterID", newWFEMasterID);

                        da.RunProc("AUTOMATION_RENEW_UpdateNewWFEMasterID", param);

                        // update LAST_PROCESS_ON
                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", drRenewRecord["VM_INSTANCE_ID"].ToString());

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", (long)drRenewRecord["OLD_PAYMENT_MASTER_ID"]);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", (long)drRenewRecord["NEW_PAYMENT_MASTER_ID"]);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@LastProcessOn", DateTime.Now);

                        da.RunProc("AUTOMATION_RENEW_UpdateLastProcessOn", param);

                        // update RENEW_STATUS_CODE
                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", drRenewRecord["VM_INSTANCE_ID"].ToString());

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", (long)drRenewRecord["OLD_PAYMENT_MASTER_ID"]);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", (long)drRenewRecord["NEW_PAYMENT_MASTER_ID"]);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewStatusCode", "IP-WFE");

                        da.RunProc("AUTOMATION_RENEW_UpdateRenewStatusCode", param);
                    }

                }

            }


            // use existing WFE creation flow
            ProcessInProgressRecord(paymentMasterIDs, processCompleteStatusCode);

        }

        private static void ProcessInProgressRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                // check if record already exist in WFE Master table
                string tokenStr = "";

                DataAccess da = new DataAccess();
                List<SqlParameter> param;

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtWFEMasterRecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);
                if (dtWFEMasterRecords.Rows.Count == 0)
                {
                    // not exist, add record to WFE Master table
                    long wfeMasterID = InsertNewWFEMasterRecord(paymentMasterID);

                    CreateAndStartWFE(paymentMasterID, wfeMasterID, tokenStr, processCompleteStatusCode);
                }
                else
                {
                    // exist, use same client token to make request
                    foreach (DataRow drWFEMasterRecord in dtWFEMasterRecords.Rows)
                    {

                        if ((drWFEMasterRecord["CLIENT_TOKEN"] != DBNull.Value) && (drWFEMasterRecord["VM_INSTANCE_ID"] == DBNull.Value))
                        {
                            // case when VM instance not created

                            tokenStr = drWFEMasterRecord["CLIENT_TOKEN"].ToString();
                            long wfeMasterID = (long)drWFEMasterRecord["RECORD_ID"];
                            CreateAndStartWFE(paymentMasterID, wfeMasterID, tokenStr, processCompleteStatusCode);
                        }
                        else if ((drWFEMasterRecord["VM_INSTANCE_ID"] != DBNull.Value) && ((drWFEMasterRecord["VM_STATUS"].ToString() == "Stopped") || (drWFEMasterRecord["VM_STATUS"].ToString() == "Starting")))
                        {
                            // case when VM instance created but not started or in starting state

                            long wfeMasterID = (long)drWFEMasterRecord["RECORD_ID"];
                            StartWFE(paymentMasterID, drWFEMasterRecord["VM_INSTANCE_ID"].ToString(), wfeMasterID, processCompleteStatusCode);
                        }

                    }

                }


                // final check on all WFE status. If all ready, update payment master status code
                VerifyWFEAndUpdatePaymentMasterRecordStatus(paymentMasterID, processCompleteStatusCode);

            }

        }

        private static void VerifyWFEAndUpdatePaymentMasterRecordStatus(long paymentMasterID, string processCompleteStatusCode)
        {
            bool allWFEReady = true;
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            DataTable dtWFEMasterRecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

            foreach (DataRow drWFEMasterRecord in dtWFEMasterRecords.Rows)
            {
                if ((drWFEMasterRecord["VM_INSTANCE_ID"] != DBNull.Value) && (drWFEMasterRecord["VM_STATUS"] != DBNull.Value))
                {
                    if (drWFEMasterRecord["VM_STATUS"].ToString() != "Running")
                    {
                        allWFEReady = false;
                        break;
                    }
                }
            }

            if (allWFEReady)
            {
                ProcessRecordHelper prHelper = new ProcessRecordHelper();

                // get WFE with earliest expiry date, update expiry date in payment master
                param = new List<SqlParameter>();
                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dt = da.RunProcDT("AUTOMATION_WFE_GetRecordWithEarliestExpiryDate", param);
                if (dt.Rows.Count == 1)
                {
                    DataRow dr = dt.Rows[0];
                    DateTime expiryDate = (DateTime)dr["EXPIRE_ON"];

                    string expiryDateString = expiryDate.ToString("yyyy-MM-dd HH:mm:ss") + ".000";
                    prHelper.UpdatePaymentMasterExpiryDate(paymentMasterID, expiryDateString);
                }

                // update status code in payment master
                prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
            }
        }

        private static long InsertNewWFEMasterRecord(long paymentMasterID)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.Bit, "@ConfigFileUpdated", false);

            SqlHelper.AddSqlParam(ref param, SqlDbType.Bit, "@IISBindingUpdated", false);

            Guid token = Guid.NewGuid();
            string tokenStr = token.ToString();
            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ClientToken", tokenStr);

            return da.RunProcReturnLongIdentity("AUTOMATION_WFE_AddNewRecord", param);
        }

        private static void CreateAndStartWFE(long paymentMasterID, long wfeMasterID, string tokenStr, string processCompleteStatusCode)
        {
            try
            {
                
                // create request to cloud API to create VM
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");

                string imageID = CommonConfig.GetParam("ImageID");
                string instanceType = CommonConfig.GetParam("InstanceType");
                string vswitchID = CommonConfig.GetParam("VSwitchID");
                string securityGroupID = CommonConfig.GetParam("SecurityGroupID");
                string adminPassword = CommonConfig.GetParam("AdminPassword");

                // WARNING:
                // This parameter is for using monthly subscription for pricing model and should only be set to "Y" in production environment
                // For testing environment, use "N" instead.
                string enableMonthlySubscription = CommonConfig.GetParam("EnableMonthlySubscription");


                IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);
                

                CreateInstanceRequest ciReq = new CreateInstanceRequest();
                ciReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;

                ciReq.Action = "CreateInstance";
                ciReq.ImageId = imageID;
                ciReq.InstanceType = instanceType;
                ciReq.VSwitchId = vswitchID;
                ciReq.SecurityGroupId = securityGroupID;
                ciReq.Password = adminPassword;
                ciReq.ClientToken = tokenStr;

                if (enableMonthlySubscription == "Y")
                {
                    ciReq.InstanceChargeType = "PrePaid";
                    ciReq.Period = 1;
                    ciReq.PeriodUnit = "Month";
                    ciReq.AutoRenew = false;
                }
                

                CreateInstanceResponse ciResp = client.GetAcsResponse(ciReq);

                // success response received
                if (!(string.IsNullOrEmpty(ciResp.InstanceId)))
                {
                    string instanceID = ciResp.InstanceId;
                    // update WFE master
                    DataAccess da = new DataAccess();

                    List<SqlParameter> param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", instanceID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMStatus", "Stopped");

                    SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@CreatedOn", System.DateTime.Now);

                    da.RunProc("AUTOMATION_WFE_UpdateRecordAfterInstanceCreated", param);


                    StartWFE(paymentMasterID, instanceID, wfeMasterID, processCompleteStatusCode);
                    

                }
                else
                {
                    // fail response received
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


        private static void StartWFE(long paymentMasterID, string instanceID, long wfeMasterID, string processCompleteStatusCode)
        {
            // create request to cloud API to create VM
            string accessKeyID = CommonConfig.GetParam("AccessKeyID");
            string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
            string regionID = CommonConfig.GetParam("RegionID");

            // WARNING:
            // This parameter is for using monthly subscription for pricing model and should only be set to "Y" in production environment
            // For testing environment, use "N" instead.
            string enableMonthlySubscription = CommonConfig.GetParam("EnableMonthlySubscription");


            IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
            DefaultAcsClient client = new DefaultAcsClient(profile);

            DataAccess da = new DataAccess();
            List<SqlParameter> param;

            DataTable dtTemp = da.RunProcDT("AUTOMATION_COMMON_GetWFEPollingInterval");
            DataRow drTemp = dtTemp.Rows[0];
            string tempStr = drTemp[0].ToString();
            int wfePollingInterval = int.Parse(tempStr);

            // issue command to poll new instance status
            bool isInstanceRunning = false;

            while (isInstanceRunning == false)
            {
                DescribeInstancesRequest diReq = new DescribeInstancesRequest();
                diReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;

                diReq.InstanceIds = "[\"" + instanceID + "\"]";

                DescribeInstancesResponse diResp = client.GetAcsResponse(diReq);

                if (diResp.TotalCount == 1)
                {
                    if (diResp.Instances[0].VpcAttributes.PrivateIpAddress.Count == 1)
                    {


                        // update WFE status
                        if (diResp.Instances[0].Status == "Stopped")
                        {
                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMStatus", "Stopped");

                            da.RunProc("AUTOMATION_WFE_UpdateVMStatusByWFEMasterID", param);


                            StartInstanceRequest siReq = new StartInstanceRequest();
                            siReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;

                            siReq.InstanceId = instanceID;

                            client.GetAcsResponse(siReq);

                            System.Threading.Thread.Sleep(wfePollingInterval);
                        }
                        else if (diResp.Instances[0].Status == "Starting")
                        {
                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMStatus", "Starting");

                            da.RunProc("AUTOMATION_WFE_UpdateVMStatusByWFEMasterID", param);


                            System.Threading.Thread.Sleep(wfePollingInterval);
                        }
                        else if (diResp.Instances[0].Status == "Running")
                        {
                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMStatus", "Running");

                            da.RunProc("AUTOMATION_WFE_UpdateVMStatusByWFEMasterID", param);

                            // update IP
                            string vmIP = diResp.Instances[0].VpcAttributes.PrivateIpAddress[0];

                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMIP", vmIP);

                            da.RunProc("AUTOMATION_WFE_UpdateVMIPByWFEMasterID", param);


                            // update expiry status. only applicable for monthly subscription
                            if (enableMonthlySubscription == "Y")
                            {
                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                                DateTime d = DateTimeOffset.Parse(diResp.Instances[0].ExpiredTime).UtcDateTime;
                                d = d.ToLocalTime();
                                SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@ExpireOn", d);

                                da.RunProc("AUTOMATION_WFE_UpdateExpireOnByWFEMasterID", param);
                            }
                            else
                            {
                                // for PayG, set to 3000-12-31 to indicate as never expire

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);
                                
                                DateTime d = new DateTime(3000, 12, 31);
                                SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@ExpireOn", d);

                                da.RunProc("AUTOMATION_WFE_UpdateExpireOnByWFEMasterID", param);
                            }

                            UpdateRenewMaster(wfeMasterID);

                            isInstanceRunning = true;
                        }
                        else
                        {
                            // TBC. Should not have other scenario
                        }
                    }
                    else
                    {
                        System.Threading.Thread.Sleep(wfePollingInterval);
                    }
                }
                else
                {
                    System.Threading.Thread.Sleep(wfePollingInterval);
                }

            }
        }


        private static void UpdateRenewMaster(long newWFEMasterID)
        {
            DataAccess da = new DataAccess();

            // only need to update if it is a renew action
            
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewWFEMasterID", newWFEMasterID);

            DataTable dtRenewMasterRecord = da.RunProcDT("AUTOMATION_RENEW_GetRecordByNewWFEMasterID", param);

            if (dtRenewMasterRecord.Rows.Count == 1)
            {
                DataRow drRenewMasterRecord = dtRenewMasterRecord.Rows[0];

                // set old WFE MASTER record to inactive
                long oldWFEMasterID = (long)drRenewMasterRecord["OLD_WFE_MASTER_ID"];

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", oldWFEMasterID);

                da.RunProc("AUTOMATION_WFE_SetToInactive", param);


                // update RENEW_STATUS_CODE
                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", drRenewMasterRecord["VM_INSTANCE_ID"].ToString());

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", (long)drRenewMasterRecord["OLD_PAYMENT_MASTER_ID"]);

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", (long)drRenewMasterRecord["NEW_PAYMENT_MASTER_ID"]);

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewStatusCode", "CP-WFE");

                da.RunProc("AUTOMATION_RENEW_UpdateRenewStatusCode", param);

                // update RENEW_REQUEST_SENT_ON
                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", drRenewMasterRecord["VM_INSTANCE_ID"].ToString());

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", (long)drRenewMasterRecord["OLD_PAYMENT_MASTER_ID"]);

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", (long)drRenewMasterRecord["NEW_PAYMENT_MASTER_ID"]);

                SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@RenewRequestSentOn", DateTime.Now);

                da.RunProc("AUTOMATION_RENEW_UpdateRenewRequestSentOn", param);

            }
        }
    }
}

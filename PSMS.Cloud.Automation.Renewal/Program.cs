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

namespace PSMS.Cloud.Automation.Renewal
{
    static class Program
    {
        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();
            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            List<long> triggeringRecords = prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "RN|ANL", true);
            foreach (long paymentMasterID in triggeringRecords)
            {
                ProcessInProgressRecord(paymentMasterID);
                RenewWFE(paymentMasterID);
                UpdateMasterRecordStatus(paymentMasterID);
            }

            List<long> inProgressRecords = prHelper.GetInProgressPaymentMasterIDs("RN|ANL");
            foreach (long paymentMasterID in inProgressRecords)
            {
                ProcessInProgressRecord(paymentMasterID);
                RenewWFE(paymentMasterID);
                UpdateMasterRecordStatus(paymentMasterID);
            }

            
        }

        private static void ProcessInProgressRecord(long paymentMasterID)
        {
            

            DataAccess da = new DataAccess();
            List<SqlParameter> param;

            param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            DataTable dtPaymentMasterRecords = da.RunProcDT("AUTOMATION_PM_GetRecordByPaymentMasterID", param);

            if (dtPaymentMasterRecords.Rows.Count == 1)
            {
                DataRow drNewOrder = dtPaymentMasterRecords.Rows[0];
                string lastOrderRef = drNewOrder["RENEWAL_LAST_ORDERREF"].ToString();
                long newPaymentMasterID = (long)drNewOrder["RECORD_ID"];

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@LastOrderRef", lastOrderRef);

                DataTable dtLastOrderRecords = da.RunProcDT("AUTOMATION_PM_GetLastOrderRecord", param);
                if (dtLastOrderRecords.Rows.Count == 1)
                {
                    DataRow drLastOrder = dtLastOrderRecords.Rows[0];
                    long oldPaymentMasterID = (long)drLastOrder["RECORD_ID"];
                    
                    PrepareRenewInfo(oldPaymentMasterID, newPaymentMasterID);
                }
            }


        }

        private static int CalculateRemainingDaysBeforeExpiry(long recordID, DateTime t)
        {
            int dayDiff = 0;

            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", recordID);

            DataTable dtOldWFEs = da.RunProcDT("AUTOMATION_WFE_GetRecordByRecordID", param);

            if (dtOldWFEs.Rows.Count == 1)
            {
                DataRow dr = dtOldWFEs.Rows[0];
                DateTime expireOn = (DateTime)dr["EXPIRE_ON"];
                expireOn = expireOn.Date; // only need the date part

                dayDiff = (expireOn - t).Days;
            }

            return dayDiff;
        }

        private static void PrepareRenewInfo(long oldPaymentMasterID, long newPaymentMasterID)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            int minDayBeforeExpiry = int.Parse(CommonConfig.GetParam("MinDayBeforeExpiry"));
            int maxDayBeforeExpiry = int.Parse(CommonConfig.GetParam("MaxDayBeforeExpiry"));
            int minuteBeforeExpiry = int.Parse(CommonConfig.GetParam("MinuteBeforeExpiry"));
            int dayBeforeRelease = int.Parse(CommonConfig.GetParam("DayBeforeRelease"));
            int minuteBeforeRelease = int.Parse(CommonConfig.GetParam("MinuteBeforeRelease"));

            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", oldPaymentMasterID);

            DataTable dtOldWFEs = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

            foreach (DataRow drOldWFE in dtOldWFEs.Rows)
            {
                string oldInstanceID = drOldWFE["VM_INSTANCE_ID"].ToString();

                // check if already added the WFE record into renew process master
                da = new DataAccess();
                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", oldInstanceID);

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

                DataTable dtCount = da.RunProcDT("AUTOMATION_RENEW_GetRenewRecord", param);

                if (dtCount.Rows.Count == 0)
                {
                    // if not found, insert into renew process master
                    string renewAction = CheckWFERenewAction(DateTime.Now, (DateTime)drOldWFE["EXPIRE_ON"], minDayBeforeExpiry, maxDayBeforeExpiry, minuteBeforeExpiry, dayBeforeRelease, minuteBeforeRelease);
                    long recordID = (long)drOldWFE["RECORD_ID"];

                    // insert record into RENEW_PROCESS_MASTER
                    da = new DataAccess();
                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldWFEMasterID", recordID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", oldInstanceID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewAction", renewAction);

                    da.RunProc("AUTOMATION_RENEW_AddNewRecord", param);

                }

            }

        }

        private static void RenewWFE(long newPaymentMasterID)
        {
            // Only need to handle records with status COPY_DB_RECORD 
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewAction", "COPY_DB_RECORD");

            DataTable dtRecords = da.RunProcDT("AUTOMATION_RENEW_GetRecordByNewPaymentMasterIDAndRenewAction", param);

            foreach (DataRow dr in dtRecords.Rows)
            {
                string instanceID = dr["VM_INSTANCE_ID"].ToString();
                long oldWFEMasterID = (long)dr["OLD_WFE_MASTER_ID"];
                long oldPaymentMasterID = (long)dr["OLD_PAYMENT_MASTER_ID"];

                bool needProcess = false;

                if (dr["LAST_PROCESS_ON"] != DBNull.Value)
                {
                    DateTime lastProcessOn = (DateTime)dr["LAST_PROCESS_ON"];
                    lastProcessOn = lastProcessOn.Date;
                    DateTime currentDate = DateTime.Now.Date;
                    int dayDiff = (currentDate - lastProcessOn).Days;
                    if (dayDiff >= 1)   // only process the record once a day
                    {
                        needProcess = true;
                    }
                }
                else
                {
                    needProcess = true;
                }

                if (needProcess)
                {
                    UpdateLastProcessDate(instanceID, oldPaymentMasterID, newPaymentMasterID, DateTime.Now);
                    bool renewResult = IssueRenewWFERequest(instanceID, oldPaymentMasterID, newPaymentMasterID);
                    if (!renewResult)
                    {
                        // check if only 1 day left before expiry. if so, change renew action to "CREATE_INSTANCE"
                        int dayDiff = CalculateRemainingDaysBeforeExpiry(oldWFEMasterID, DateTime.Now);
                        if (dayDiff <= 1)
                        {
                            // update renew action
                            UpdateRenewAction(instanceID, oldPaymentMasterID, newPaymentMasterID, "CREATE_INSTANCE");
                        }
                    }
                }

                
            }

            // for records with CREATE_INSTANCE status, leave them for WFE automation program to handle

        }

        private static void UpdateMasterRecordStatus(long newPaymentMasterID)
        {
            ProcessRecordHelper helper = new ProcessRecordHelper();
            helper.UpdatePaymentMasterStatusCode(newPaymentMasterID, "RN|INIT");
            
        }

        private static string CheckWFERenewAction(DateTime renewDate, DateTime expiryDate, int minDayBeforeExpiry, int maxDayBeforeExpiry, int minuteBeforeExpiry, int dayBeforeRelease, int minuteBeforeRelease)
        {
            string result = "";

            expiryDate = expiryDate.Date; // only need the date part for calculation

            if (renewDate < expiryDate)
            {
                int dayDiff = (expiryDate - renewDate).Days;
                if (dayDiff <= maxDayBeforeExpiry && dayDiff > minDayBeforeExpiry)
                {
                    result = "COPY_DB_RECORD";
                }
                else if (dayDiff < minDayBeforeExpiry && dayDiff >= 0)
                {
                    double minuteDiff = (expiryDate - renewDate).TotalMinutes;
                    if (minuteDiff >= minuteBeforeExpiry)
                    {
                        result = "COPY_DB_RECORD";
                    }
                    else
                    {
                        result = "CREATE_INSTANCE";
                    }
                }
                else if (dayDiff > maxDayBeforeExpiry)
                {
                    // occurs if a user has 2 (or more) WFE, in which WFE1 has expired and others has not. Just need to renew those not expired WFE by a month.
                    result = "COPY_DB_RECORD";  
                }
            }
            else if ((renewDate - expiryDate).Days >= dayBeforeRelease)
            {
                result = "NOT_ALLOW";
            }
            else
            {
                result = "CREATE_INSTANCE";
            }

            return result;
        }


        private static bool IssueRenewWFERequest(string instanceID, long oldPaymentMasterID, long newPaymentMasterID)
        {


            // issue request
            bool result = false;

            string accessKeyID = CommonConfig.GetParam("AccessKeyID");
            string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
            string regionID = CommonConfig.GetParam("RegionID");

            IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
            DefaultAcsClient client = new DefaultAcsClient(profile);

            RenewInstanceRequest riReq = new RenewInstanceRequest();
            riReq.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;

            riReq.InstanceId = instanceID;
            riReq.Period = 1;
            riReq.PeriodUnit = "Month";

            try
            {
                RenewInstanceResponse riResp = client.GetAcsResponse(riReq);

                if (!(string.IsNullOrEmpty(riResp.RequestId)))
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                // enable the flag will assume PayG renew success if the error code received is "ChargeTypeViolation"
                if (CommonConfig.GetParam("PayGFollowSubscriptionBehavior") == "Y")
                {
                    if (((Aliyun.Acs.Core.Exceptions.ClientException)ex).ErrorCode == "ChargeTypeViolation")
                    {
                        result = true;
                    }
                }
                else
                {
                    Console.WriteLine(ex.ToString());
                }
            }

            if (result)
            {
                // update DB to indicate this record has been renewed
                UpdateRenewRequestSentOn(instanceID, oldPaymentMasterID, newPaymentMasterID, DateTime.Now);
                UpdateRenewStatusCode(instanceID, oldPaymentMasterID, newPaymentMasterID, "CP-WFE");
            }

            return result;
        }

        private static void UpdateLastProcessDate(string instanceID, long oldPaymentMasterID, long newPaymentMasterID, DateTime lastProcessOn)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", instanceID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@LastProcessOn", lastProcessOn);

            da.RunProc("AUTOMATION_RENEW_UpdateLastProcessOn", param);
        }

        private static void UpdateRenewRequestSentOn(string instanceID, long oldPaymentMasterID, long newPaymentMasterID, DateTime renewRequestSentOn)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", instanceID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@RenewRequestSentOn", renewRequestSentOn);

            da.RunProc("AUTOMATION_RENEW_UpdateRenewRequestSentOn", param);
        }

        private static void UpdateRenewStatusCode(string instanceID, long oldPaymentMasterID, long newPaymentMasterID, string renewStatusCode)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", instanceID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewStatusCode", renewStatusCode);

            da.RunProc("AUTOMATION_RENEW_UpdateRenewStatusCode", param);
        }

        private static void UpdateRenewAction(string instanceID, long oldPaymentMasterID, long newPaymentMasterID, string renewAction)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VMInstanceID", instanceID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldPaymentMasterID", oldPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", newPaymentMasterID);

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@RenewAction", renewAction);

            da.RunProc("AUTOMATION_RENEW_UpdateRenewAction", param);
        }

    }
}

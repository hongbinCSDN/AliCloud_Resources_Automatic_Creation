using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace PSMS.Cloud.Common
{
    public class ProcessRecordHelper
    {

        protected List<long> TriggeringPaymentMasterIDs { get; set; }
        protected List<long> InProgressPaymentMasterIDs { get; set; }



        public List<long> GetTriggeringPaymentMasterIDs(string triggerStatusCode, string updatedStatusCodeValue, bool needCheckPaymentStatus)
        {
            try
            {
                TriggeringPaymentMasterIDs = new List<long>();

                DataAccess da = new DataAccess();
                List<SqlParameter> param;
                param = new List<SqlParameter>();

                SqlParameter pStatusCode = new SqlParameter("@StatusCode", SqlDbType.NVarChar);
                pStatusCode.Value = triggerStatusCode;
                param.Add(pStatusCode);

                DataTable dtProcessRecords = da.RunProcDT("AUTOMATION_PM_GetRecordByStatusCode", param);

                if (dtProcessRecords.Rows.Count > 0)
                {
                    foreach (DataRow drProcessRecords in dtProcessRecords.Rows)
                    {
                        string statusPayment = drProcessRecords["STATUS_PAYMENT"].ToString();

                        // Payment gateway return "0" for transaction success, "1" for error
                        if ((!needCheckPaymentStatus) || (needCheckPaymentStatus && statusPayment == "0"))
                        {
                            long paymentMasterID = (long)drProcessRecords["RECORD_ID"];

                            // update payment master status
                            UpdatePaymentMasterStatusCode(paymentMasterID, updatedStatusCodeValue);

                            TriggeringPaymentMasterIDs.Add(paymentMasterID);
                        }
                    }
                }

                return TriggeringPaymentMasterIDs;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return null;
            }
        }

        

        public List<long> GetInProgressPaymentMasterIDs(string inProgressStatusCodeValue)
        {
            try
            {
                InProgressPaymentMasterIDs = new List<long>();

                DataAccess da = new DataAccess();
                List<SqlParameter> param;
                param = new List<SqlParameter>();

                SqlParameter pStatusCode = new SqlParameter("@StatusCode", SqlDbType.NVarChar);
                pStatusCode.Value = inProgressStatusCodeValue;
                param.Add(pStatusCode);

                DataTable dtProcessRecords = da.RunProcDT("AUTOMATION_PM_GetRecordByStatusCode", param);

                if (dtProcessRecords.Rows.Count > 0)
                {
                    foreach (DataRow drProcessRecords in dtProcessRecords.Rows)
                    {
                        long paymentMasterID = (long)drProcessRecords["RECORD_ID"];


                        InProgressPaymentMasterIDs.Add(paymentMasterID);
                    }
                }

                return InProgressPaymentMasterIDs;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return null;
            }
        }

        private string GetAPIToken()
        {
            string token = "";

            using (var client = new WebClient())
            {
                var loginAPIInfo = new NameValueCollection();
                loginAPIInfo["CUSTOMER_ID"] = CommonConfig.GetParam("APILoginAccount");
                loginAPIInfo["PASSWORD"] = CommonConfig.GetParam("APILoginPassword");

                string apiLoginURL = CommonConfig.GetParam("APILoginURL");

                var getTokenResponse = client.UploadValues(apiLoginURL, loginAPIInfo);

                token = Encoding.Default.GetString(getTokenResponse).Trim('"');

                Console.WriteLine(token);
            }

            return token;
        }

        public void UpdatePaymentMasterStatusCode(long paymentMasterID, string statusCode)
        {
            string token = GetAPIToken();

            using (var client = new WebClient())
            {
                var updateInfo = new NameValueCollection();
                updateInfo["RECORD_ID"] = paymentMasterID.ToString();
                updateInfo["STATUS_CODE"] = statusCode;
                updateInfo["USERNAME"] = CommonConfig.GetParam("APILoginAccount");
                updateInfo["PASSWORD"] = CommonConfig.GetParam("APILoginPassword");

                string apiStatusUpdateURL = CommonConfig.GetParam("APIStatusUpdateURL");

                client.Headers.Add("Authorization", "bearer " + token);

                var getUpdateResponse = client.UploadValues(apiStatusUpdateURL, updateInfo);

                var updateResult = Encoding.Default.GetString(getUpdateResponse);

                Console.WriteLine(updateResult);
            }

        }
                

        public void UpdatePaymentMasterExpiryDate(long paymentMasterID, string expiryDateString)
        {
            string token = GetAPIToken();

            using (var client = new WebClient())
            {
                var updateInfo = new NameValueCollection();
                updateInfo["RECORD_ID"] = paymentMasterID.ToString();
                updateInfo["PRODUCT_AT_TIME"] = expiryDateString;
                updateInfo["USERNAME"] = CommonConfig.GetParam("APILoginAccount");
                updateInfo["PASSWORD"] = CommonConfig.GetParam("APILoginPassword");

                string expiryDateUpdateURL = CommonConfig.GetParam("APIExpiryDateUpdateURL");

                client.Headers.Add("Authorization", "bearer " + token);

                var getUpdateResponse = client.UploadValues(expiryDateUpdateURL, updateInfo);

                var updateResult = Encoding.Default.GetString(getUpdateResponse);

                Console.WriteLine(updateResult);
            }

        }

        public void UpdatePaymentMasterStatusCodeBySP(long paymentMasterID, string statusCode)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param = new List<SqlParameter>();

            SqlParameter pPaymentMasterID = new SqlParameter("@RecordID", SqlDbType.BigInt);
            pPaymentMasterID.Value = paymentMasterID;
            param.Add(pPaymentMasterID);


            SqlParameter pStatusCode = new SqlParameter("@StatusCode", SqlDbType.NVarChar);
            pStatusCode.Value = statusCode;
            param.Add(pStatusCode);

            da.RunProc("AUTOMATION_PM_UpdateStatusCode", param);
        }


    }
}

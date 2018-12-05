using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using PSMS.Cloud.Common;
using Microsoft.SqlServer.Server;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;

namespace PSMS.Cloud.Automation.DB
{
    static class Program
    {

        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-DB", false), "CP-DB");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-DB"), "CP-DB");
            
            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessRenewRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-DB", false), "RN|CP-DB");
            ProcessRenewRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-DB"), "RN|CP-DB");
        }

        private static void ProcessRenewRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                // check if DB Master already has new record
                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);


                DataTable dtNewDBMasterRecord = da.RunProcDT("AUTOMATION_DB_GetRecordByPaymentMasterID", param);

                if (dtNewDBMasterRecord.Rows.Count == 0)
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

                            DataTable dtOldDBMasterRecord = da.RunProcDT("AUTOMATION_DB_GetRecordByPaymentMasterID", param);

                            if (dtOldDBMasterRecord.Rows.Count == 1)
                            {
                                DataRow drOldDBMasterRecord = dtOldDBMasterRecord.Rows[0];

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldDBMasterID", (long)drOldDBMasterRecord["RECORD_ID"]);

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", paymentMasterID);

                                da.RunProc("[AUTOMATION_RENEW_DuplicateDBRecord]", param);
                            }
                        }
                    }
                }

                ProcessRecordHelper prHelper = new ProcessRecordHelper();
                prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
            }
        }

        private static string GetScriptFileLocation(string sequence)
        {
            string scriptFolderPath = CommonConfig.GetParam("ScriptFolderPath");
            scriptFolderPath = scriptFolderPath.Trim();
            scriptFolderPath = scriptFolderPath.TrimEnd('/') + "/";

            string scriptFileLocation = "";
            DataAccess da = new DataAccess();
            List<SqlParameter> param;

            param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@TriggerSequence", sequence);

            DataTable dt = da.RunProcDT("AUTOMATION_COMMON_GetScriptFileNameByTriggerSequence", param);

            if (dt.Rows.Count == 1)
            {
                string fileName = dt.Rows[0]["SCRIPT_FILE_NAME"].ToString();
                scriptFileLocation = scriptFolderPath + fileName;
            }

            return scriptFileLocation;

        }




        private static void ProcessInProgressRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                // check if record already exist in DB Master table
                DataAccess da = new DataAccess();
                List<SqlParameter> param;

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtDBMasterRecords = da.RunProcDT("AUTOMATION_DB_GetRecordByPaymentMasterID", param);


                if (dtDBMasterRecords.Rows.Count == 0)
                {
                    DataTable dtDBInstMasterRecords = da.RunProcDT("AUTOMATION_COMMON_GetCurrentDBInstMasterID");
                    if (dtDBInstMasterRecords.Rows.Count == 1)
                    {
                        long dbInstanceMasterID = (long)dtDBInstMasterRecords.Rows[0]["RECORD_ID"];

                        // get payment master record
                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                        DataTable dtPaymentMasterRecords = da.RunProcDT("AUTOMATION_PM_GetRecordByPaymentMasterID", param);

                        if (dtPaymentMasterRecords.Rows.Count == 1)
                        {
                            DataRow drPaymentMasterRecord = dtPaymentMasterRecords.Rows[0];
                            string subdomain = drPaymentMasterRecord["DOMAIN_NAME"].ToString();

                            string dbName = "PSMS_" + subdomain;

                            // insert new record to DB master
                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@DBInstanceMasterID", dbInstanceMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@DBName", dbName);

                            long dbRecordID = da.RunProcReturnLongIdentity("AUTOMATION_DB_AddNewRecord", param);

                            RunSqlScript(paymentMasterID, dbRecordID, processCompleteStatusCode);
                        }

                    }
                    else
                    {
                        // throw error: # of active DB instance should be 1
                    }

                }
                else
                {
                    foreach (DataRow drDBMasterRecord in dtDBMasterRecords.Rows)
                    {
                        long dbRecordID = (long)drDBMasterRecord["RECORD_ID"];
                        RunSqlScript(paymentMasterID, dbRecordID, processCompleteStatusCode);
                    }
                }
            }

        }


        private static void RunSqlScript(long paymentMasterID, long dbRecordID, string processCompleteStatusCode)
        {
            string runScriptResult = "";

            DataAccess da = new DataAccess();

            List<SqlParameter> param;

            param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dbRecordID);

            DataTable dtDBMasterRecords = da.RunProcDT("AUTOMATION_DB_GetRecordByRecordID", param);


            if (dtDBMasterRecords.Rows.Count == 1)
            {
                
                DataRow drDBMasterRecord = dtDBMasterRecords.Rows[0];
                string dbName = drDBMasterRecord["DB_NAME"].ToString();

                long dbInstanceMasterID = (long)drDBMasterRecord["DB_INSTANCE_MASTER_ID"];

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dbInstanceMasterID);

                DataTable dtDBInstanceMasterRecords = da.RunProcDT("AUTOMATION_DBINST_GetRecordByRecordID", param);
                if (dtDBInstanceMasterRecords.Rows.Count == 1)
                {
                    string targetDBInstanceConnectionString = dtDBInstanceMasterRecords.Rows[0]["CONNECTION_STRING"].ToString();
                    runScriptResult = drDBMasterRecord["PROVISION_STATUS_CODE"].ToString();
                    if (runScriptResult == "000" )
                    {
                        // 000 = DB not created
                        string masterDBConnectionString = CommonConfig.GetParam("MasterDBConnectionString");
                        string createDBSqlFilePath = GetScriptFileLocation("000");
                        runScriptResult = ExecuteCommand(masterDBConnectionString, dbName, createDBSqlFilePath, dbRecordID, runScriptResult);

                        if (runScriptResult != "")
                        {
                            while (runScriptResult != "" && runScriptResult != "CP")
                            {
                                runScriptResult = RunOtherScript(dbRecordID, runScriptResult, targetDBInstanceConnectionString, dbName);
                            }
                        }
                    }
                    else
                    {
                        // other values = DB created, need to execute script in sequence
                        while (runScriptResult != "" && runScriptResult != "CP")
                        {
                            runScriptResult = RunOtherScript(dbRecordID, runScriptResult, targetDBInstanceConnectionString, dbName);
                        }
                    }

                    if (runScriptResult == "CP")
                    {
                        ProcessRecordHelper prHelper = new ProcessRecordHelper();
                        prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
                    }

                }
            }

            
        }

        private static string RunOtherScript(long dbRecordID, string currentSequence, string targetDBInstanceConnectionString, string targetDBName)
        {
            string psmsDBConnectionString = CommonConfig.GetParam("PSMSDBConnectionString");
            psmsDBConnectionString = psmsDBConnectionString.Replace("[[PSMS_DBINSTANCENAME]]", targetDBInstanceConnectionString);
            psmsDBConnectionString = psmsDBConnectionString.Replace("[[PSMS_DBNAME]]", targetDBName);

            string sqlFilePath = GetScriptFileLocation(currentSequence);
            return ExecuteCommand(psmsDBConnectionString, targetDBName, sqlFilePath, dbRecordID, currentSequence);
        }


        private static string ExecuteCommand(string connectionString, string dbName, string filePath, long dbRecordID, string currentSequence)
        {

            string result = "";

            try
            {
                // execute command on new DB
                string command = File.ReadAllText(filePath);

                command = command.Replace("<<DBNAME>>", dbName);

                string userProfileStatusCode = CommonConfig.GetParam("UserProfileStatusCode");
                string scheduleJobStatusCode = CommonConfig.GetParam("ScheduleJobStatusCode");

                if (currentSequence == userProfileStatusCode)
                {
                    // use user db name to generate MDF5 value, then use first 8 character of MDF5 value as password
                    string password = CommonConfig.CalculateMD5Hash(dbName);
                    password = password.Substring(0, 8);
                    command = command.Replace("<<PASSWORD>>", password);
                }
                else if (currentSequence == scheduleJobStatusCode)
                {
                    // special handling for create schedule job
                    // change the schedule id to different value
                    Guid guid = Guid.NewGuid();
                    string guidStr = guid.ToString().Replace("{", "").Replace("}", "");
                    guidStr = guidStr.ToLower();
                    command = command.Replace("<<GUID>>", guidStr);
                }


                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    Server db = new Server(new ServerConnection(conn));

                    db.ConnectionContext.ExecuteNonQuery(command);
                }



                // update provision status code
                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", dbRecordID);

                result = da.RunProcReturnScalar("AUTOMATION_DB_UpdateProvisionStatusCodeByRecordID", param).ToString();


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                result = "";
            }
            return result;
        }
    }

}

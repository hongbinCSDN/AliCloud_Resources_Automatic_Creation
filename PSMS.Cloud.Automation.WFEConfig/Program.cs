using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using PSMS.Cloud.Common;
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Ecs.Model.V20140526;

namespace PSMS.Cloud.Automation.WFEConfig
{
    static class Program
    {
        static void Main(string[] args)
        {
            CleanupPreviousCommand();

            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-WFECFG", false), "CP-WFECFG");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-WFECFG"), "CP-WFECFG");

            // renewal - use the same process in progress records routine
            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-WFECFG", false), "RN|CP-WFECFG");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-WFECFG"), "RN|CP-WFECFG");
            
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

                    if ((drWFEMasterRecord["VM_STATUS"] != DBNull.Value) && (drWFEMasterRecord["CONFIG_FILE_UPDATED"] != DBNull.Value))
                    {
                        long relatedPaymentMasterID = (long)drWFEMasterRecord["PAYMENT_MASTER_ID"];
                        long wfeMasterID = (long)drWFEMasterRecord["RECORD_ID"];
                        string vmInstanceID = drWFEMasterRecord["VM_INSTANCE_ID"].ToString();
                        string vmStatus = drWFEMasterRecord["VM_STATUS"].ToString();
                        string internetIP = drWFEMasterRecord["INTERNET_IP"].ToString();
                        bool configFileUpdated = (bool)drWFEMasterRecord["CONFIG_FILE_UPDATED"];

                        // case when VM already running and web.config file not updated
                        if ((vmStatus == "Running") && (configFileUpdated == false))
                        {
                            CreateConfigCommand(relatedPaymentMasterID, wfeMasterID, vmInstanceID, internetIP, processCompleteStatusCode);
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
                if ((drWFEMasterRecord["VM_STATUS"] != DBNull.Value) && (drWFEMasterRecord["CONFIG_FILE_UPDATED"] != DBNull.Value))
                {
                    if (drWFEMasterRecord["VM_STATUS"].ToString() != "Running" || !((bool)drWFEMasterRecord["CONFIG_FILE_UPDATED"]))
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

        private static void CleanupPreviousCommand()
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                string cmdContentFile = CommonConfig.GetParam("CommandContentFile");
                long describeCommandPageSize = long.Parse(CommonConfig.GetParam("DescribeCommandPageSize"));

                IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);

                DescribeCommandsRequest dcReq = new DescribeCommandsRequest();
                dcReq.PageSize = describeCommandPageSize;

                DescribeCommandsResponse resp = client.GetAcsResponse(dcReq);
                if (resp.TotalCount > 0)
                {
                    for (int i=0; i<resp.TotalCount; i++)
                    {
                        string commandName = resp.Commands[i].Name;
                        if (commandName.IndexOf("CMD_UpdWFECFgFile")>=0)
                        {
                            DeleteCommand(resp.Commands[i].CommandId);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
        
        private static void CreateConfigCommand(long paymentMasterID, long wfeMasterID, string vmInstanceID, string internetIP, string processCompleteStatusCode)
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                string cmdContentFile = CommonConfig.GetParam("CommandContentFile");

                // Create a client used for initiating a request
                IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);

                CreateCommandRequest req = new CreateCommandRequest();
                req.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;

                req.Action = "CreateCommand";
                req.Name = "CMD_UpdWFECFgFile";
                req.Type = "RunPowerShellScript";
                req.Description = "CreateCommand_UpdateWebConfigFile: " + vmInstanceID;

                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtResult = da.RunProcDT("AUTOMATION_COMMON_GetDBInfoByPaymentMasterID", param);

                if (dtResult.Rows.Count == 1)
                {
                    DataRow drResult = dtResult.Rows[0];

                    da = new DataAccess();
                    param = new List<SqlParameter>();
                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);
                    DataTable dtPaymentMaster = da.RunProcDT("AUTOMATION_PM_GetRecordByPaymentMasterID", param);

                    DataRow drPaymentMaster = dtPaymentMaster.Rows[0];
                    string domainName = drPaymentMaster["DOMAIN_NAME"].ToString();


                    string cmdContent = cmdContentFile + " " + drResult["CONNECTION_STRING"].ToString() + " " + drResult["DB_NAME"].ToString() + " " + domainName +"." + CommonConfig.GetParam("DomainName");
                    req.CommandContent = System.Text.Encoding.UTF8.EncodeBase64(cmdContent);

                    CreateCommandResponse ccrResp = client.GetAcsResponse(req);


                    if (!string.IsNullOrEmpty(ccrResp.RequestId) && !string.IsNullOrEmpty(ccrResp.CommandId))
                    {
                        InvokeConfigCommand(ccrResp.CommandId, paymentMasterID, wfeMasterID, vmInstanceID, internetIP, processCompleteStatusCode);
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

        private static void InvokeConfigCommand(string commandId, long paymentMasterID, long wfeMasterID, string vmInstanceID, string internetIP, string processCompleteStatusCode)
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");

                IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);

                InvokeCommandRequest req = new InvokeCommandRequest();
                req.Protocol = Aliyun.Acs.Core.Http.ProtocolType.HTTPS;
                req.Action = "InvokeCommand";

                List<string> instIDs = new List<string>();
                instIDs.Add(vmInstanceID);
                req.InstanceIds = instIDs;

                req.CommandId = commandId;


                InvokeCommandResponse icrResp = client.GetAcsResponse(req);
                if (!(string.IsNullOrEmpty(icrResp.RequestId)) && !(string.IsNullOrEmpty(icrResp.InvokeId)))
                {
                    // Delete created command
                    DeleteCommand(commandId);
                    
                    // start polling for http request code
                    SendPollingRequest(paymentMasterID, wfeMasterID, internetIP, processCompleteStatusCode);
                    
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

        private static void DeleteCommand(string commandID)
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");

                IClientProfile profile = DefaultProfile.GetProfile(regionID, accessKeyID, accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);

                DeleteCommandRequest req = new DeleteCommandRequest();
                req.Action = "DeleteCommand";
                req.CommandId = commandID;

                DeleteCommandResponse dcrResp = client.GetAcsResponse(req);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        private static void SendPollingRequest(long paymentMasterID, long wfeMasterID, string internetIP, string processCompleteStatusCode)
        {
            DataAccess da = new DataAccess();
            List<SqlParameter> param;

            string link = "http://" + internetIP + "/psms";

            DataTable dtTemp = da.RunProcDT("AUTOMATION_COMMON_GetWFEPollingInterval");
            DataRow drTemp = dtTemp.Rows[0];
            string tempStr = drTemp[0].ToString();
            int wfePollingInterval = int.Parse(tempStr);


            dtTemp = da.RunProcDT("AUTOMATION_COMMON_GetWFEPollingMaxRetryCount");
            drTemp = dtTemp.Rows[0];
            tempStr = drTemp[0].ToString();
            int wfeMaxRetryCount = int.Parse(tempStr);


            int currentRetryCount = 0;
            bool isProcessComplete = false;

            while (isProcessComplete == false)
            {
                
                Uri uri = new Uri(link);
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(link);
                request.Credentials = System.Net.CredentialCache.DefaultCredentials;

                request.Timeout = int.Parse(CommonConfig.GetParam("PollingTimeoutInterval"));

                string responseStatusCode = "";

                try
                {
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    responseStatusCode = response.StatusCode.ToString();
                }
                catch (WebException e)
                {
                    if (e.Response != null)
                        responseStatusCode = ((HttpWebResponse)e.Response).StatusCode.ToString();
                    else
                    {
                        responseStatusCode = "";
                    }
                }

                if (responseStatusCode.ToUpper() != "OK")
                {
                    System.Threading.Thread.Sleep(wfePollingInterval);

                    // retry until max count reached
                    if (currentRetryCount < wfeMaxRetryCount)
                    {
                        currentRetryCount++;
                    }
                    else
                    {
                        // ignore retry and process next record. The batch job will rerun for the next retry.
                        isProcessComplete = true;
                    }
                }
                else
                {

                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.Bit, "@ConfigFileUpdated", true);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                    da.RunProc("AUTOMATION_WFE_UpdateConfigFlagByWFEMasterID", param);
                   

                    isProcessComplete = true;

                }
                
            }

        }
        
    }
}

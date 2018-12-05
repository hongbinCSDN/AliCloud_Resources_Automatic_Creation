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
using Aliyun.Acs.Slb.Model.V20140515;

namespace PSMS.Cloud.Automation.SLB
{
    static class Program
    {
        static void Main(string[] args)
        {
            ProcessRecordHelper prHelper = new ProcessRecordHelper();

            string triggerStatusCode = CommonConfig.GetParam("TriggerStatusCode");
            ProcessInProgressRecord(prHelper.GetTriggeringPaymentMasterIDs(triggerStatusCode, "IP-SLB", false), "CP-SLB");
            ProcessInProgressRecord(prHelper.GetInProgressPaymentMasterIDs("IP-SLB"), "CP-SLB");    

            string renewStatusCode = CommonConfig.GetParam("RenewStatusCode");
            ProcessRenewRecord(prHelper.GetTriggeringPaymentMasterIDs(renewStatusCode, "RN|IP-SLB", false), "RN|CP-SLB");
            ProcessRenewRecord(prHelper.GetInProgressPaymentMasterIDs("RN|IP-SLB"), "RN|CP-SLB");
        }


        private static void ProcessRenewRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                DataAccess da = new DataAccess();
                List<SqlParameter> param = new List<SqlParameter>();

                // check if SLB Master already has new record
                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtNewSLBMasterRecord = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

                if (dtNewSLBMasterRecord.Rows.Count == 0)
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

                            DataTable dtOldSLBMasterRecord = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

                            if (dtOldSLBMasterRecord.Rows.Count == 1)
                            {
                                DataRow drOldSLBMasterRecord = dtOldSLBMasterRecord.Rows[0];

                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@OldSLBMasterID", (long)drOldSLBMasterRecord["RECORD_ID"]);

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@NewPaymentMasterID", paymentMasterID);

                                // set to complete adding https listener status to trigger add backend server action
                                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-LSTR443");

                                da.RunProc("AUTOMATION_RENEW_DuplicateSLBRecordWithNewProvisionStatusCode", param);
                            }
                        }
                    }
                }
            }


            ProcessInProgressRecord(paymentMasterIDs, processCompleteStatusCode);
        }


        private static void ProcessInProgressRecord(List<long> paymentMasterIDs, string processCompleteStatusCode)
        {
            foreach (long paymentMasterID in paymentMasterIDs)
            {
                // check if record already exist in SLB Master table
                string tokenStr = "";
                long slbMasterID = 0;

                DataAccess da = new DataAccess();
                List<SqlParameter> param;

                param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                DataTable dtSLBMasterRecords = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

                if (dtSLBMasterRecords.Rows.Count == 0)
                {
                    // not exist, add record to SLB Master table
                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                    Guid token = Guid.NewGuid();
                    tokenStr = token.ToString();
                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ClientToken", tokenStr);

                    slbMasterID = da.RunProcReturnLongIdentity("AUTOMATION_SLB_AddNewRecord", param);

                    CreateSLBInstance(slbMasterID, tokenStr);
                    AddListenerPort(80, paymentMasterID, "CP-INST");
                    AddListenerPort(443, paymentMasterID, "CP-LSTR80");
                    AddBackendServer(paymentMasterID, "CP-LSTR443");
                    StartSLB(paymentMasterID, "CP-BES", processCompleteStatusCode);
                }
                else if (dtSLBMasterRecords.Rows.Count == 1)
                {
                    DataRow drSLBMasterRecord = dtSLBMasterRecords.Rows[0];
                    slbMasterID = (long)drSLBMasterRecord["RECORD_ID"];

                    if (drSLBMasterRecord["PROVISION_STATUS_CODE"] != DBNull.Value)
                    {
                        if (drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "CP-INST" ||
                            drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "IP-LSTR80")
                        {
                            AddListenerPort(80, paymentMasterID, drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString());
                            AddListenerPort(443, paymentMasterID, "CP-LSTR80");
                            AddBackendServer(paymentMasterID, "CP-LSTR443");
                            StartSLB(paymentMasterID, "CP-BES", processCompleteStatusCode);
                        }
                        else if (drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "CP-LSTR80" ||
                                 drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "IP-LSTR443")
                        {
                            AddListenerPort(443, paymentMasterID, drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString());
                            AddBackendServer(paymentMasterID, "CP-LSTR443");
                            StartSLB(paymentMasterID, "CP-BES", processCompleteStatusCode);
                        }
                        else if (drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "CP-LSTR443" ||
                                 drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "IP-BES")
                        {
                            AddBackendServer(paymentMasterID, drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString());

                            if (processCompleteStatusCode != "RN|CP-SLB")
                                StartSLB(paymentMasterID, "CP-BES", processCompleteStatusCode);
                            else
                            {
                                // For renewal, no need to start SLB as already started. Only update provision status and payment master status.

                                // update provision status to CP-ST
                                param = new List<SqlParameter>();

                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-ST");

                                da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);

                                // update payment master record status
                                ProcessRecordHelper prHelper = new ProcessRecordHelper();
                                prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);
                            }
                        }
                        else if (drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "CP-BES" ||
                                 drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == "IP-ST")
                        {
                            StartSLB(paymentMasterID, drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString(), processCompleteStatusCode);
                        }
                    }
                }
                else
                {
                    // should not have more than 1 record in DB. TBD in future
                }
            }

        }

        private static void CreateSLBInstance(long slbMasterID, string tokenStr)
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                string loadBalancerSpec = CommonConfig.GetParam("LoadBalancerSpec");
                string masterZoneID = CommonConfig.GetParam("MasterZoneID");
                string slaveZoneID = CommonConfig.GetParam("SlaveZoneID");

                // Create a client used for initiating a request
                IClientProfile profile = DefaultProfile.GetProfile(
                    regionID,
                    accessKeyID,
                    accessKeySecret);
                DefaultAcsClient client = new DefaultAcsClient(profile);

                // Create the request
                CreateLoadBalancerRequest req = new CreateLoadBalancerRequest();
                req.LoadBalancerSpec = loadBalancerSpec;
                req.MasterZoneId = masterZoneID;
                req.SlaveZoneId = slaveZoneID;
                req.ClientToken = tokenStr;


                DataAccess da = new DataAccess();


                // update provision status to IP-INST
                List<SqlParameter> param = new List<SqlParameter>();

                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "IP-INST");

                da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);

                CreateLoadBalancerResponse clbrResp = client.GetAcsResponse(req);

                if (!string.IsNullOrEmpty(clbrResp.LoadBalancerId))
                {
                    string loadBalancerID = clbrResp.LoadBalancerId;
                    string internetIP = clbrResp.Address;


                    // update provision status to CP-INST
                    param = new List<SqlParameter>();

                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLBInstanceID", loadBalancerID);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLBStatus", "Stopped");

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@InternetIP", internetIP);

                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-INST");

                    SqlHelper.AddSqlParam(ref param, SqlDbType.DateTime, "@CreatedOn", System.DateTime.Now);

                    da.RunProc("AUTOMATION_SLB_UpdateRecordAfterInstanceCreated", param);

                    
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

        private static void AddListenerPort(int portNumber, long paymentMasterID, string triggerProvisionStatusCode)
        {
            try
            {

                DataTable dtSLBMasterRecords = GetSLBMasterRecords(paymentMasterID);

                if (dtSLBMasterRecords.Rows.Count == 1)
                {
                    if (dtSLBMasterRecords.Rows[0]["PROVISION_STATUS_CODE"].ToString() == triggerProvisionStatusCode)
                    {
                        long slbMasterID = (long)dtSLBMasterRecords.Rows[0]["RECORD_ID"];
                        string loadBalancerID = dtSLBMasterRecords.Rows[0]["SLB_INSTANCE_ID"].ToString();


                        // update provision status to IP-LSTR
                        DataAccess da = new DataAccess();

                        List<SqlParameter> param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "IP-LSTR" + portNumber);

                        da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);

                        string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                        string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                        string regionID = CommonConfig.GetParam("RegionID");


                        // Create a client used for initiating a request
                        IClientProfile profile = DefaultProfile.GetProfile(
                            regionID,
                            accessKeyID,
                            accessKeySecret);
                        DefaultAcsClient client = new DefaultAcsClient(profile);
                        // Create the request
                        CreateLoadBalancerTCPListenerRequest req = new CreateLoadBalancerTCPListenerRequest();
                        req.LoadBalancerId = loadBalancerID;
                        req.ListenerPort = portNumber;
                        req.BackendServerPort = portNumber;
                        req.Bandwidth = -1;

                        CreateLoadBalancerTCPListenerResponse clbResp = client.GetAcsResponse(req);

                        if (!string.IsNullOrEmpty(clbResp.RequestId))
                        {

                            // update provision status to CP-LSTR
                            param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-LSTR" + portNumber);

                            da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);
                        }
                    }
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

        private static void AddBackendServer(long paymentMasterID, string triggerProvisionStatusCode)
        {
            try
            {

                DataTable dtSLBMasterRecords = GetSLBMasterRecords(paymentMasterID);

                if (dtSLBMasterRecords.Rows.Count == 1)
                {
                    if (dtSLBMasterRecords.Rows[0]["PROVISION_STATUS_CODE"].ToString() == triggerProvisionStatusCode)
                    {
                        long slbMasterID = (long)dtSLBMasterRecords.Rows[0]["RECORD_ID"];
                        string loadBalancerID = dtSLBMasterRecords.Rows[0]["SLB_INSTANCE_ID"].ToString();
                        string internetIP = dtSLBMasterRecords.Rows[0]["INTERNET_IP"].ToString();


                        // update provision status to IP-BES
                        DataAccess da = new DataAccess();

                        List<SqlParameter> param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "IP-BES");

                        da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);

                        

                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

                        DataTable dtWFEMasterRecords = da.RunProcDT("AUTOMATION_WFE_GetRecordByPaymentMasterID", param);

                        foreach (DataRow drWFEMasterRecord in dtWFEMasterRecords.Rows)
                        {
                            if (drWFEMasterRecord["SLB_MASTER_ID"] == DBNull.Value)
                            {
                                // if need to assign different values, use this instead: int weight = Convert.ToInt32(Math.Floor((double)(100 / dtWFEMasterRecords.Rows.Count)));
                                int weight = 100; 

                                string backendServerID = drWFEMasterRecord["VM_INSTANCE_ID"].ToString();
                                long wfeMasterID = (long)drWFEMasterRecord["RECORD_ID"];

                                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                                string regionID = CommonConfig.GetParam("RegionID");


                                // Create a client used for initiating a request
                                IClientProfile profile = DefaultProfile.GetProfile(
                                    regionID,
                                    accessKeyID,
                                    accessKeySecret);
                                DefaultAcsClient client = new DefaultAcsClient(profile);

                                // Create the request
                                AddBackendServersRequest req = new AddBackendServersRequest();
                                req.LoadBalancerId = loadBalancerID;

                                string formattedStr = "[{\"ServerId\":\"" + backendServerID + "\",\"Weight\":\"" + weight + "\"}]";
                                req.BackendServers = formattedStr;

                                AddBackendServersResponse absResp = client.GetAcsResponse(req);

                                if (!string.IsNullOrEmpty(absResp.LoadBalancerId))
                                {
                                    // update SLB ID and Internet IP for WFE records
                                    param = new List<SqlParameter>();

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", wfeMasterID);

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLBMasterID", slbMasterID);

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@InternetIP", internetIP);

                                    da.RunProc("AUTOMATION_WFE_UpdateRecordAfterSLBCreated", param);

                                }
                            }
                        }

                        // update provision status to CP-BES
                        param = new List<SqlParameter>();

                        SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                        SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-BES");

                        da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);
                        
                    }
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

        private static void StartSLB(long paymentMasterID, string triggerProvisionStatusCode, string processCompleteStatusCode)
        {
            try
            {

                DataTable dtSLBMasterRecords = GetSLBMasterRecords(paymentMasterID);

                if (dtSLBMasterRecords.Rows.Count == 1)
                {
                    DataRow drSLBMasterRecord = dtSLBMasterRecords.Rows[0];
                    if (drSLBMasterRecord["PROVISION_STATUS_CODE"].ToString() == triggerProvisionStatusCode &&
                        drSLBMasterRecord["SLB_STATUS"] != DBNull.Value)
                    {

                        if (drSLBMasterRecord["SLB_STATUS"].ToString() == "Stopped")
                        {
                            long slbMasterID = (long)drSLBMasterRecord["RECORD_ID"];


                            // update provision status to IP-ST
                            DataAccess da = new DataAccess();

                            List<SqlParameter> param = new List<SqlParameter>();

                            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "IP-ST");

                            da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);


                            string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                            string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                            string regionID = CommonConfig.GetParam("RegionID");


                            // Create a client used for initiating a request
                            IClientProfile profile = DefaultProfile.GetProfile(
                                regionID,
                                accessKeyID,
                                accessKeySecret);
                            DefaultAcsClient client = new DefaultAcsClient(profile);

                            // Create the request
                            StartLoadBalancerListenerRequest req = new StartLoadBalancerListenerRequest();
                            string loadBalancerID = drSLBMasterRecord["SLB_INSTANCE_ID"].ToString();

                            req.LoadBalancerId = loadBalancerID;
                            req.ListenerPort = 80;

                            StartLoadBalancerListenerResponse slblResp = client.GetAcsResponse(req);


                            if (!string.IsNullOrEmpty(slblResp.RequestId))
                            {
                                req = new StartLoadBalancerListenerRequest();

                                req.LoadBalancerId = loadBalancerID;
                                req.ListenerPort = 443;

                                slblResp = client.GetAcsResponse(req);

                                if (!string.IsNullOrEmpty(slblResp.RequestId))
                                {
                                    // update SLB status to running
                                    param = new List<SqlParameter>();

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLBStatus", "Running");

                                    da.RunProc("AUTOMATION_SLB_UpdateSLBStatus", param);


                                    // update provision status to CP-ST
                                    param = new List<SqlParameter>();

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@RecordID", slbMasterID);

                                    SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@ProvisionStatusCode", "CP-ST");

                                    da.RunProc("AUTOMATION_SLB_UpdateProvisionStatusCode", param);


                                    // update cloud resource master to CP-SLB
                                    ProcessRecordHelper prHelper = new ProcessRecordHelper();
                                    prHelper.UpdatePaymentMasterStatusCode(paymentMasterID, processCompleteStatusCode);

                                }
                            }
                        }
                        
                    }
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

        private static DataTable GetSLBMasterRecords(long paymentMasterID)
        {
            DataAccess da = new DataAccess();

            List<SqlParameter> param = new List<SqlParameter>();

            SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@PaymentMasterID", paymentMasterID);

            DataTable dtSLBMasterRecords = da.RunProcDT("AUTOMATION_SLB_GetRecordByPaymentMasterID", param);

            return dtSLBMasterRecords;
        }
    }


}

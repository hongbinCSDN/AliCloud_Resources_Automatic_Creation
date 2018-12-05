using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Dm.Model.V20151123;
using PSMS.Cloud.Common;

namespace PSMS.Cloud.Automation.EmailNotification
{
    static class Program
    {
        static void Main(string[] args)
        {
            SendEmail();
        }

        private static void SendEmail()
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                DataAccess da = new DataAccess();
                DataTable dtEamilRecord = da.RunProcDT("AUTOMATION_EMAIL_GetReadySendEmail");
                List<SqlParameter> param = new List<SqlParameter>();

                if (dtEamilRecord.Rows.Count > 0)
                {
                    foreach (DataRow drEmailRecord in dtEamilRecord.Rows)
                    {

                        IClientProfile profile = DefaultProfile.GetProfile(
                                   regionID,
                                   accessKeyID,
                                   accessKeySecret);
                        DefaultAcsClient client = new DefaultAcsClient(profile);
                        SingleSendMailRequest MailReq = new SingleSendMailRequest();
                        try
                        {
                            MailReq.AccountName = drEmailRecord["ACCOUNTNAME"].ToString();
                            MailReq.ReplyToAddress = Convert.ToBoolean(drEmailRecord["REPLYTOADDRESS"].ToString());
                            MailReq.AddressType = int.Parse(drEmailRecord["ADDRESSTYPE"].ToString());
                            MailReq.ToAddress = drEmailRecord["TOADDRESS"].ToString();
                            //MailReq.FromAlias = drEmailRecord["FROMALIAS"].ToString();
                            MailReq.Subject = drEmailRecord["SUBJECT"].ToString();
                            MailReq.HtmlBody = drEmailRecord["HTMLBODY"].ToString();
                            SingleSendMailResponse MailResp = client.GetAcsResponse(MailReq);
                            if (!string.IsNullOrEmpty(MailReq.RegionId))
                            {
                                param = new List<SqlParameter>();
                                SqlHelper.AddSqlParam(ref param, SqlDbType.BigInt, "@EMAIL_ID", int.Parse(drEmailRecord["EMAIL_ID"].ToString()));
                                SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "STATE", "100");
                                da.RunProc("AUTOMATION_EMAIL_UpdateEmailStatus",param);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.ToString());
                        }
                    }
                }
            }
            catch(ServerException ex)
            {
                Console.WriteLine(ex.ToString());
            }
            catch(ClientException ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
    }
}

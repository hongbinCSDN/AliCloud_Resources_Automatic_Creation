using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Ecs.Model.V20140526;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Aliyun.Acs.Rds.Model.V20140815;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aliyun.Acs.Slb.Model.V20140515;
using PSMS.Cloud.Common;
using Aliyun.Acs.Domain.Model.V20180129;
using Aliyun.Acs.Alidns.Model.V20150109;

namespace PSMS.Cloud.Automation.ResourceMonitoring
{
    static class Program
    {
        static void Main(string[] args)
        {
            MonitoringCloudResource();
        }

        private static void MonitoringCloudResource()
        {
            try
            {
                string accessKeyID = CommonConfig.GetParam("AccessKeyID");
                string accessKeySecret = CommonConfig.GetParam("AccessKeySecret");
                string regionID = CommonConfig.GetParam("RegionID");
                IClientProfile profile = DefaultProfile.GetProfile(
                        regionID,
                        accessKeyID,
                        accessKeySecret
                    );
                DefaultAcsClient client = new DefaultAcsClient(profile);
                //ECS Request
                DescribeInstancesRequest InstancesRequest = new DescribeInstancesRequest();
                //RDS Request
                DescribeDBInstancesRequest DBInstancesRequest = new DescribeDBInstancesRequest();
                //SLB Request
                DescribeLoadBalancersRequest LoadBalancersRequest = new DescribeLoadBalancersRequest();
                //DNS Request
                //QueryDomainListRequest DomainListRequest = new QueryDomainListRequest();
                DescribeDomainRecordsRequest DomainRecordsRequest = new DescribeDomainRecordsRequest();

                DataAccess da = new DataAccess();
                List<SqlParameter> param; 
                try
                {
                    //ECS Response
                    DescribeInstancesResponse InstancesResponse = client.GetAcsResponse(InstancesRequest);
                    if (!string.IsNullOrEmpty(InstancesResponse.RequestId))
                    {
                        foreach(var instance in InstancesResponse.Instances)
                        {
                            param = new List<SqlParameter>();
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VM_INSTANCE_ID", instance.InstanceId);
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@VM_STATUS", instance.Status);
                            da.RunProc("AUTOMATION_MONITORING_ECSStatus", param);
                        }                     
                    }

                    //RDS Response 
                    DescribeDBInstancesResponse DBInstancesResponse = client.GetAcsResponse(DBInstancesRequest);
                    if (!string.IsNullOrEmpty(DBInstancesResponse.RequestId))
                    {
                        foreach(var item in DBInstancesResponse.Items)
                        {
                            param = new List<SqlParameter>();
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@DB_INSTANCE_ID", item.DBInstanceId);
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@DB_INSTANCE_STATUS", item.DBInstanceStatus);
                            da.RunProc("AUTOMATION_MONITORING_RDSStatus", param);
                        }
                    }

                    //SLB Response
                    DescribeLoadBalancersResponse LoadBalancersResponse = client.GetAcsResponse(LoadBalancersRequest);
                    if (!string.IsNullOrEmpty(LoadBalancersResponse.RequestId))
                    {
                        foreach(var loadBalancer in LoadBalancersResponse.LoadBalancers)
                        {
                            param = new List<SqlParameter>();
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLB_INSTANCE_ID", loadBalancer.LoadBalancerId);
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SLB_STATUS", loadBalancer.LoadBalancerStatus);
                            da.RunProc("AUTOMATION_MONITORING_SLBStatus", param);
                        }
                    }

                    //DNS Response

                    //DomainListRequest.PageNum = 1;
                    //DomainListRequest.PageSize = 10;                  
                    //QueryDomainListResponse DomainListResponse = client.GetAcsResponse(DomainListRequest);
                   
                    DomainRecordsRequest.PageNumber = 1;
                    DomainRecordsRequest.PageSize = 20;
                    DomainRecordsRequest.DomainName = CommonConfig.GetParam("DomainName");
                    DescribeDomainRecordsResponse DomainRecordsResponse = client.GetAcsResponse(DomainRecordsRequest);
                    if (!string.IsNullOrEmpty(DomainRecordsResponse.RequestId))
                    {
                        foreach(var domainRecord in DomainRecordsResponse.DomainRecords)
                        {
                            param = new List<SqlParameter>();
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@SUBDOMAIN", domainRecord.RR);
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@DNS_IP", domainRecord.Value);
                            SqlHelper.AddSqlParam(ref param, SqlDbType.NVarChar, "@STATUS", domainRecord.Status);
                            da.RunProc("AUTOMATION_MONITORING_DNSStatus", param);
                        }
                    }
                  
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
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

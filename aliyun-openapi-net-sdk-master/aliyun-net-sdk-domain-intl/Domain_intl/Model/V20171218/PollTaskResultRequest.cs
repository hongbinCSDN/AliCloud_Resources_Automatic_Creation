/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Http;
using Aliyun.Acs.Core.Transform;
using Aliyun.Acs.Core.Utils;
using Aliyun.Acs.Domain_intl.Transform;
using Aliyun.Acs.Domain_intl.Transform.V20171218;
using System.Collections.Generic;

namespace Aliyun.Acs.Domain_intl.Model.V20171218
{
    public class PollTaskResultRequest : RpcAcsRequest<PollTaskResultResponse>
    {
        public PollTaskResultRequest()
            : base("Domain_intl", "2017-12-18", "PollTaskResult", "domain", "openAPI")
        {
        }

		private string instanceId;

		private string userClientIp;

		private string taskNo;

		private string domainName;

		private int? pageSize;

		private string lang;

		private int? pageNum;

		private int? taskResultStatus;

		public string InstanceId
		{
			get
			{
				return instanceId;
			}
			set	
			{
				instanceId = value;
				DictionaryUtil.Add(QueryParameters, "InstanceId", value);
			}
		}

		public string UserClientIp
		{
			get
			{
				return userClientIp;
			}
			set	
			{
				userClientIp = value;
				DictionaryUtil.Add(QueryParameters, "UserClientIp", value);
			}
		}

		public string TaskNo
		{
			get
			{
				return taskNo;
			}
			set	
			{
				taskNo = value;
				DictionaryUtil.Add(QueryParameters, "TaskNo", value);
			}
		}

		public string DomainName
		{
			get
			{
				return domainName;
			}
			set	
			{
				domainName = value;
				DictionaryUtil.Add(QueryParameters, "DomainName", value);
			}
		}

		public int? PageSize
		{
			get
			{
				return pageSize;
			}
			set	
			{
				pageSize = value;
				DictionaryUtil.Add(QueryParameters, "PageSize", value.ToString());
			}
		}

		public string Lang
		{
			get
			{
				return lang;
			}
			set	
			{
				lang = value;
				DictionaryUtil.Add(QueryParameters, "Lang", value);
			}
		}

		public int? PageNum
		{
			get
			{
				return pageNum;
			}
			set	
			{
				pageNum = value;
				DictionaryUtil.Add(QueryParameters, "PageNum", value.ToString());
			}
		}

		public int? TaskResultStatus
		{
			get
			{
				return taskResultStatus;
			}
			set	
			{
				taskResultStatus = value;
				DictionaryUtil.Add(QueryParameters, "TaskResultStatus", value.ToString());
			}
		}

        public override PollTaskResultResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return PollTaskResultResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
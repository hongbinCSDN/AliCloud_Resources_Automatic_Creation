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
using Aliyun.Acs.pvtz.Transform;
using Aliyun.Acs.pvtz.Transform.V20180101;
using System.Collections.Generic;

namespace Aliyun.Acs.pvtz.Model.V20180101
{
    public class UpdateZoneRecordRequest : RpcAcsRequest<UpdateZoneRecordResponse>
    {
        public UpdateZoneRecordRequest()
            : base("pvtz", "2018-01-01", "UpdateZoneRecord", "pvtz", "openAPI")
        {
        }

		private string rr;

		private long? recordId;

		private string userClientIp;

		private string lang;

		private string type;

		private int? priority;

		private int? ttl;

		private string _value;

		public string Rr
		{
			get
			{
				return rr;
			}
			set	
			{
				rr = value;
				DictionaryUtil.Add(QueryParameters, "Rr", value);
			}
		}

		public long? RecordId
		{
			get
			{
				return recordId;
			}
			set	
			{
				recordId = value;
				DictionaryUtil.Add(QueryParameters, "RecordId", value.ToString());
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

		public string Type
		{
			get
			{
				return type;
			}
			set	
			{
				type = value;
				DictionaryUtil.Add(QueryParameters, "Type", value);
			}
		}

		public int? Priority
		{
			get
			{
				return priority;
			}
			set	
			{
				priority = value;
				DictionaryUtil.Add(QueryParameters, "Priority", value.ToString());
			}
		}

		public int? Ttl
		{
			get
			{
				return ttl;
			}
			set	
			{
				ttl = value;
				DictionaryUtil.Add(QueryParameters, "Ttl", value.ToString());
			}
		}

		public string _Value
		{
			get
			{
				return _value;
			}
			set	
			{
				_value = value;
				DictionaryUtil.Add(QueryParameters, "Value", value);
			}
		}

        public override UpdateZoneRecordResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return UpdateZoneRecordResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
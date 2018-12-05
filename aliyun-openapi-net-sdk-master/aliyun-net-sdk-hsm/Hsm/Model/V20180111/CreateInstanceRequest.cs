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
using Aliyun.Acs.hsm.Transform;
using Aliyun.Acs.hsm.Transform.V20180111;
using System.Collections.Generic;

namespace Aliyun.Acs.hsm.Model.V20180111
{
    public class CreateInstanceRequest : RpcAcsRequest<CreateInstanceResponse>
    {
        public CreateInstanceRequest()
            : base("hsm", "2018-01-11", "CreateInstance", "hsm", "openAPI")
        {
			Method = MethodType.POST;
        }

		private int? period;

		private string periodUnit;

		private string resourceOwnerId;

		private int? quantity;

		private string hsmDeviceType;

		private string clientToken;

		private string zoneId;

		private string hsmOem;

		public int? Period
		{
			get
			{
				return period;
			}
			set	
			{
				period = value;
				DictionaryUtil.Add(QueryParameters, "Period", value.ToString());
			}
		}

		public string PeriodUnit
		{
			get
			{
				return periodUnit;
			}
			set	
			{
				periodUnit = value;
				DictionaryUtil.Add(QueryParameters, "PeriodUnit", value);
			}
		}

		public string ResourceOwnerId
		{
			get
			{
				return resourceOwnerId;
			}
			set	
			{
				resourceOwnerId = value;
				DictionaryUtil.Add(QueryParameters, "ResourceOwnerId", value);
			}
		}

		public int? Quantity
		{
			get
			{
				return quantity;
			}
			set	
			{
				quantity = value;
				DictionaryUtil.Add(QueryParameters, "Quantity", value.ToString());
			}
		}

		public string HsmDeviceType
		{
			get
			{
				return hsmDeviceType;
			}
			set	
			{
				hsmDeviceType = value;
				DictionaryUtil.Add(QueryParameters, "HsmDeviceType", value);
			}
		}

		public string ClientToken
		{
			get
			{
				return clientToken;
			}
			set	
			{
				clientToken = value;
				DictionaryUtil.Add(QueryParameters, "ClientToken", value);
			}
		}

		public string ZoneId
		{
			get
			{
				return zoneId;
			}
			set	
			{
				zoneId = value;
				DictionaryUtil.Add(QueryParameters, "ZoneId", value);
			}
		}

		public string HsmOem
		{
			get
			{
				return hsmOem;
			}
			set	
			{
				hsmOem = value;
				DictionaryUtil.Add(QueryParameters, "HsmOem", value);
			}
		}

		public override bool CheckShowJsonItemName()
		{
			return false;
		}

        public override CreateInstanceResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return CreateInstanceResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
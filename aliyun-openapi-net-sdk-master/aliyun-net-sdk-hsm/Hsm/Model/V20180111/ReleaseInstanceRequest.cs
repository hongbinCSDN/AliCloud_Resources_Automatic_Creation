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
    public class ReleaseInstanceRequest : RpcAcsRequest<ReleaseInstanceResponse>
    {
        public ReleaseInstanceRequest()
            : base("hsm", "2018-01-11", "ReleaseInstance", "hsm", "openAPI")
        {
			Method = MethodType.POST;
        }

		private string resourceOwnerId;

		private string instanceId;

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

		public override bool CheckShowJsonItemName()
		{
			return false;
		}

        public override ReleaseInstanceResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return ReleaseInstanceResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
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
using Aliyun.Acs.CSB.Transform;
using Aliyun.Acs.CSB.Transform.V20171118;
using System.Collections.Generic;

namespace Aliyun.Acs.CSB.Model.V20171118
{
    public class DeleteCasServiceRequest : RpcAcsRequest<DeleteCasServiceResponse>
    {
        public DeleteCasServiceRequest()
            : base("CSB", "2017-11-18", "DeleteCasService", "CSB", "openAPI")
        {
			Protocol = ProtocolType.HTTPS;
			Method = MethodType.POST;
        }

		private bool? leafOnly;

		private string casCsbName;

		private string srcUserId;

		private string casServiceId;

		public bool? LeafOnly
		{
			get
			{
				return leafOnly;
			}
			set	
			{
				leafOnly = value;
				DictionaryUtil.Add(QueryParameters, "LeafOnly", value.ToString());
			}
		}

		public string CasCsbName
		{
			get
			{
				return casCsbName;
			}
			set	
			{
				casCsbName = value;
				DictionaryUtil.Add(QueryParameters, "CasCsbName", value);
			}
		}

		public string SrcUserId
		{
			get
			{
				return srcUserId;
			}
			set	
			{
				srcUserId = value;
				DictionaryUtil.Add(QueryParameters, "SrcUserId", value);
			}
		}

		public string CasServiceId
		{
			get
			{
				return casServiceId;
			}
			set	
			{
				casServiceId = value;
				DictionaryUtil.Add(QueryParameters, "CasServiceId", value);
			}
		}

		public override bool CheckShowJsonItemName()
		{
			return false;
		}

        public override DeleteCasServiceResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return DeleteCasServiceResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
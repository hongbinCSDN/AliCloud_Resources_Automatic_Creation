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
using Aliyun.Acs.CS.Transform;
using Aliyun.Acs.CS.Transform.V20151215;
using System.Collections.Generic;

namespace Aliyun.Acs.CS.Model.V20151215
{
    public class DeleteClusterNodeRequest : RoaAcsRequest<DeleteClusterNodeResponse>
    {
        public DeleteClusterNodeRequest()
            : base("CS", "2015-12-15", "DeleteClusterNode")
        {
			UriPattern = "/clusters/[ClusterId]/ip/[Ip]";
			Method = MethodType.DELETE;
        }

		private string releaseInstance;

		private string ip;

		private string force;

		private string clusterId;

		public string ReleaseInstance
		{
			get
			{
				return releaseInstance;
			}
			set	
			{
				releaseInstance = value;
				DictionaryUtil.Add(QueryParameters, "releaseInstance", value);
			}
		}

		public string Ip
		{
			get
			{
				return ip;
			}
			set	
			{
				ip = value;
				DictionaryUtil.Add(PathParameters, "Ip", value);
			}
		}

		public string Force
		{
			get
			{
				return force;
			}
			set	
			{
				force = value;
				DictionaryUtil.Add(QueryParameters, "force", value);
			}
		}

		public string ClusterId
		{
			get
			{
				return clusterId;
			}
			set	
			{
				clusterId = value;
				DictionaryUtil.Add(PathParameters, "ClusterId", value);
			}
		}

        public override DeleteClusterNodeResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return DeleteClusterNodeResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
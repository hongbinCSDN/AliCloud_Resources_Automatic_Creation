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
using Aliyun.Acs.afs.Transform;
using Aliyun.Acs.afs.Transform.V20180112;
using System.Collections.Generic;

namespace Aliyun.Acs.afs.Model.V20180112
{
    public class DescribeConfigNameRequest : RpcAcsRequest<DescribeConfigNameResponse>
    {
        public DescribeConfigNameRequest()
            : base("afs", "2018-01-12", "DescribeConfigName")
        {
        }

		private long? resourceOwnerId;

		private string sourceIp;

		public long? ResourceOwnerId
		{
			get
			{
				return resourceOwnerId;
			}
			set	
			{
				resourceOwnerId = value;
				DictionaryUtil.Add(QueryParameters, "ResourceOwnerId", value.ToString());
			}
		}

		public string SourceIp
		{
			get
			{
				return sourceIp;
			}
			set	
			{
				sourceIp = value;
				DictionaryUtil.Add(QueryParameters, "SourceIp", value);
			}
		}

		public override bool CheckShowJsonItemName()
		{
			return false;
		}

        public override DescribeConfigNameResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return DescribeConfigNameResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
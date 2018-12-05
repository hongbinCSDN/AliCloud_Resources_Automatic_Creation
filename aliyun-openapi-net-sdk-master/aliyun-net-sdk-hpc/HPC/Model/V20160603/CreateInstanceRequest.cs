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
using Aliyun.Acs.HPC.Transform;
using Aliyun.Acs.HPC.Transform.V20160603;
using System.Collections.Generic;

namespace Aliyun.Acs.HPC.Model.V20160603
{
    public class CreateInstanceRequest : RpcAcsRequest<CreateInstanceResponse>
    {
        public CreateInstanceRequest()
            : base("HPC", "2016-06-03", "CreateInstance")
        {
			Method = MethodType.POST;
        }

		private string tOKEN;

		private string packageId;

		public string TOKEN
		{
			get
			{
				return tOKEN;
			}
			set	
			{
				tOKEN = value;
				DictionaryUtil.Add(QueryParameters, "TOKEN", value);
			}
		}

		public string PackageId
		{
			get
			{
				return packageId;
			}
			set	
			{
				packageId = value;
				DictionaryUtil.Add(QueryParameters, "PackageId", value);
			}
		}

        public override CreateInstanceResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return CreateInstanceResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
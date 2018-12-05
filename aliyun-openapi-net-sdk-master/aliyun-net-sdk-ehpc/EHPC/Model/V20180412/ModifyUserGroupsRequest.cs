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
using Aliyun.Acs.EHPC.Transform;
using Aliyun.Acs.EHPC.Transform.V20180412;
using System.Collections.Generic;

namespace Aliyun.Acs.EHPC.Model.V20180412
{
    public class ModifyUserGroupsRequest : RpcAcsRequest<ModifyUserGroupsResponse>
    {
        public ModifyUserGroupsRequest()
            : base("EHPC", "2018-04-12", "ModifyUserGroups", "ehs", "openAPI")
        {
        }

		private string action;

		private string clusterId;

		private List<User> users;

		private string accessKeyId;

		public string Action
		{
			get
			{
				return action;
			}
			set	
			{
				action = value;
				DictionaryUtil.Add(QueryParameters, "Action", value);
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
				DictionaryUtil.Add(QueryParameters, "ClusterId", value);
			}
		}

		public List<User> Users
		{
			get
			{
				return users;
			}

			set
			{
				users = value;
				for (int i = 0; i < users.Count; i++)
				{
					DictionaryUtil.Add(QueryParameters,"User." + (i + 1) + ".Name", users[i].Name);
					DictionaryUtil.Add(QueryParameters,"User." + (i + 1) + ".Group", users[i].Group);
				}
			}
		}

		public string AccessKeyId
		{
			get
			{
				return accessKeyId;
			}
			set	
			{
				accessKeyId = value;
				DictionaryUtil.Add(QueryParameters, "AccessKeyId", value);
			}
		}

		public class User
		{

			private string name;

			private string group;

			public string Name
			{
				get
				{
					return name;
				}
				set	
				{
					name = value;
				}
			}

			public string Group
			{
				get
				{
					return group;
				}
				set	
				{
					group = value;
				}
			}
		}

        public override ModifyUserGroupsResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return ModifyUserGroupsResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
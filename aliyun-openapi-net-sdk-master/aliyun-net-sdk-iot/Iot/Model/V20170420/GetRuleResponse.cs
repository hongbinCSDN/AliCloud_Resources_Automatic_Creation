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
using System.Collections.Generic;

namespace Aliyun.Acs.Iot.Model.V20170420
{
	public class GetRuleResponse : AcsResponse
	{

		private string requestId;

		private bool? success;

		private string errorMessage;

		private GetRule_RuleInfo ruleInfo;

		public string RequestId
		{
			get
			{
				return requestId;
			}
			set	
			{
				requestId = value;
			}
		}

		public bool? Success
		{
			get
			{
				return success;
			}
			set	
			{
				success = value;
			}
		}

		public string ErrorMessage
		{
			get
			{
				return errorMessage;
			}
			set	
			{
				errorMessage = value;
			}
		}

		public GetRule_RuleInfo RuleInfo
		{
			get
			{
				return ruleInfo;
			}
			set	
			{
				ruleInfo = value;
			}
		}

		public class GetRule_RuleInfo
		{

			private long? id;

			private string select;

			private string topic;

			private string shortTopic;

			private string _where;

			private string status;

			private long? createUserId;

			private string productKey;

			private string name;

			private string ruleDesc;

			private string created;

			private string dataType;

			private string modified;

			public long? Id
			{
				get
				{
					return id;
				}
				set	
				{
					id = value;
				}
			}

			public string Select
			{
				get
				{
					return select;
				}
				set	
				{
					select = value;
				}
			}

			public string Topic
			{
				get
				{
					return topic;
				}
				set	
				{
					topic = value;
				}
			}

			public string ShortTopic
			{
				get
				{
					return shortTopic;
				}
				set	
				{
					shortTopic = value;
				}
			}

			public string _Where
			{
				get
				{
					return _where;
				}
				set	
				{
					_where = value;
				}
			}

			public string Status
			{
				get
				{
					return status;
				}
				set	
				{
					status = value;
				}
			}

			public long? CreateUserId
			{
				get
				{
					return createUserId;
				}
				set	
				{
					createUserId = value;
				}
			}

			public string ProductKey
			{
				get
				{
					return productKey;
				}
				set	
				{
					productKey = value;
				}
			}

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

			public string RuleDesc
			{
				get
				{
					return ruleDesc;
				}
				set	
				{
					ruleDesc = value;
				}
			}

			public string Created
			{
				get
				{
					return created;
				}
				set	
				{
					created = value;
				}
			}

			public string DataType
			{
				get
				{
					return dataType;
				}
				set	
				{
					dataType = value;
				}
			}

			public string Modified
			{
				get
				{
					return modified;
				}
				set	
				{
					modified = value;
				}
			}
		}
	}
}
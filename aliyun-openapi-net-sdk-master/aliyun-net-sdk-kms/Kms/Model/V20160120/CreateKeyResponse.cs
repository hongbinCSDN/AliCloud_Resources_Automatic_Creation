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

namespace Aliyun.Acs.Kms.Model.V20160120
{
	public class CreateKeyResponse : AcsResponse
	{

		private string requestId;

		private CreateKey_KeyMetadata keyMetadata;

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

		public CreateKey_KeyMetadata KeyMetadata
		{
			get
			{
				return keyMetadata;
			}
			set	
			{
				keyMetadata = value;
			}
		}

		public class CreateKey_KeyMetadata
		{

			private string creationDate;

			private string description;

			private string keyId;

			private string keyState;

			private string keyUsage;

			private string deleteDate;

			private string creator;

			private string arn;

			private string origin;

			private string materialExpireTime;

			public string CreationDate
			{
				get
				{
					return creationDate;
				}
				set	
				{
					creationDate = value;
				}
			}

			public string Description
			{
				get
				{
					return description;
				}
				set	
				{
					description = value;
				}
			}

			public string KeyId
			{
				get
				{
					return keyId;
				}
				set	
				{
					keyId = value;
				}
			}

			public string KeyState
			{
				get
				{
					return keyState;
				}
				set	
				{
					keyState = value;
				}
			}

			public string KeyUsage
			{
				get
				{
					return keyUsage;
				}
				set	
				{
					keyUsage = value;
				}
			}

			public string DeleteDate
			{
				get
				{
					return deleteDate;
				}
				set	
				{
					deleteDate = value;
				}
			}

			public string Creator
			{
				get
				{
					return creator;
				}
				set	
				{
					creator = value;
				}
			}

			public string Arn
			{
				get
				{
					return arn;
				}
				set	
				{
					arn = value;
				}
			}

			public string Origin
			{
				get
				{
					return origin;
				}
				set	
				{
					origin = value;
				}
			}

			public string MaterialExpireTime
			{
				get
				{
					return materialExpireTime;
				}
				set	
				{
					materialExpireTime = value;
				}
			}
		}
	}
}
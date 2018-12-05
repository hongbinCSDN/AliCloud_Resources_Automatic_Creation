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
using Aliyun.Acs.Dyvmsapi.Transform;
using Aliyun.Acs.Dyvmsapi.Transform.V20170525;
using System.Collections.Generic;

namespace Aliyun.Acs.Dyvmsapi.Model.V20170525
{
    public class SmartCallRequest : RpcAcsRequest<SmartCallResponse>
    {
        public SmartCallRequest()
            : base("Dyvmsapi", "2017-05-25", "SmartCall")
        {
        }

		private long? resourceOwnerId;

		private bool? actionCodeBreak;

		private string resourceOwnerAccount;

		private bool? recordFlag;

		private long? ownerId;

		private int? speed;

		private string accessKeyId;

		private int? volume;

		private string dynamicId;

		private string calledNumber;

		private string voiceCode;

		private int? muteTime;

		private string calledShowNumber;

		private string action;

		private string outId;

		private string asrModelId;

		private int? pauseTime;

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

		public bool? ActionCodeBreak
		{
			get
			{
				return actionCodeBreak;
			}
			set	
			{
				actionCodeBreak = value;
				DictionaryUtil.Add(QueryParameters, "ActionCodeBreak", value.ToString());
			}
		}

		public string ResourceOwnerAccount
		{
			get
			{
				return resourceOwnerAccount;
			}
			set	
			{
				resourceOwnerAccount = value;
				DictionaryUtil.Add(QueryParameters, "ResourceOwnerAccount", value);
			}
		}

		public bool? RecordFlag
		{
			get
			{
				return recordFlag;
			}
			set	
			{
				recordFlag = value;
				DictionaryUtil.Add(QueryParameters, "RecordFlag", value.ToString());
			}
		}

		public long? OwnerId
		{
			get
			{
				return ownerId;
			}
			set	
			{
				ownerId = value;
				DictionaryUtil.Add(QueryParameters, "OwnerId", value.ToString());
			}
		}

		public int? Speed
		{
			get
			{
				return speed;
			}
			set	
			{
				speed = value;
				DictionaryUtil.Add(QueryParameters, "Speed", value.ToString());
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

		public int? Volume
		{
			get
			{
				return volume;
			}
			set	
			{
				volume = value;
				DictionaryUtil.Add(QueryParameters, "Volume", value.ToString());
			}
		}

		public string DynamicId
		{
			get
			{
				return dynamicId;
			}
			set	
			{
				dynamicId = value;
				DictionaryUtil.Add(QueryParameters, "DynamicId", value);
			}
		}

		public string CalledNumber
		{
			get
			{
				return calledNumber;
			}
			set	
			{
				calledNumber = value;
				DictionaryUtil.Add(QueryParameters, "CalledNumber", value);
			}
		}

		public string VoiceCode
		{
			get
			{
				return voiceCode;
			}
			set	
			{
				voiceCode = value;
				DictionaryUtil.Add(QueryParameters, "VoiceCode", value);
			}
		}

		public int? MuteTime
		{
			get
			{
				return muteTime;
			}
			set	
			{
				muteTime = value;
				DictionaryUtil.Add(QueryParameters, "MuteTime", value.ToString());
			}
		}

		public string CalledShowNumber
		{
			get
			{
				return calledShowNumber;
			}
			set	
			{
				calledShowNumber = value;
				DictionaryUtil.Add(QueryParameters, "CalledShowNumber", value);
			}
		}

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

		public string OutId
		{
			get
			{
				return outId;
			}
			set	
			{
				outId = value;
				DictionaryUtil.Add(QueryParameters, "OutId", value);
			}
		}

		public string AsrModelId
		{
			get
			{
				return asrModelId;
			}
			set	
			{
				asrModelId = value;
				DictionaryUtil.Add(QueryParameters, "AsrModelId", value);
			}
		}

		public int? PauseTime
		{
			get
			{
				return pauseTime;
			}
			set	
			{
				pauseTime = value;
				DictionaryUtil.Add(QueryParameters, "PauseTime", value.ToString());
			}
		}

        public override SmartCallResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return SmartCallResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
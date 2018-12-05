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
using Aliyun.Acs.live.Transform;
using Aliyun.Acs.live.Transform.V20161101;
using System.Collections.Generic;

namespace Aliyun.Acs.live.Model.V20161101
{
    public class ModifyCasterVideoResourceRequest : RpcAcsRequest<ModifyCasterVideoResourceResponse>
    {
        public ModifyCasterVideoResourceRequest()
            : base("live", "2016-11-01", "ModifyCasterVideoResource", "live", "openAPI")
        {
        }

		private string resourceId;

		private int? beginOffset;

		private string vodUrl;

		private string liveStreamUrl;

		private string casterId;

		private string action;

		private int? endOffset;

		private string resourceName;

		private int? repeatNum;

		private long? ownerId;

		private string materialId;

		public string ResourceId
		{
			get
			{
				return resourceId;
			}
			set	
			{
				resourceId = value;
				DictionaryUtil.Add(QueryParameters, "ResourceId", value);
			}
		}

		public int? BeginOffset
		{
			get
			{
				return beginOffset;
			}
			set	
			{
				beginOffset = value;
				DictionaryUtil.Add(QueryParameters, "BeginOffset", value.ToString());
			}
		}

		public string VodUrl
		{
			get
			{
				return vodUrl;
			}
			set	
			{
				vodUrl = value;
				DictionaryUtil.Add(QueryParameters, "VodUrl", value);
			}
		}

		public string LiveStreamUrl
		{
			get
			{
				return liveStreamUrl;
			}
			set	
			{
				liveStreamUrl = value;
				DictionaryUtil.Add(QueryParameters, "LiveStreamUrl", value);
			}
		}

		public string CasterId
		{
			get
			{
				return casterId;
			}
			set	
			{
				casterId = value;
				DictionaryUtil.Add(QueryParameters, "CasterId", value);
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

		public int? EndOffset
		{
			get
			{
				return endOffset;
			}
			set	
			{
				endOffset = value;
				DictionaryUtil.Add(QueryParameters, "EndOffset", value.ToString());
			}
		}

		public string ResourceName
		{
			get
			{
				return resourceName;
			}
			set	
			{
				resourceName = value;
				DictionaryUtil.Add(QueryParameters, "ResourceName", value);
			}
		}

		public int? RepeatNum
		{
			get
			{
				return repeatNum;
			}
			set	
			{
				repeatNum = value;
				DictionaryUtil.Add(QueryParameters, "RepeatNum", value.ToString());
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

		public string MaterialId
		{
			get
			{
				return materialId;
			}
			set	
			{
				materialId = value;
				DictionaryUtil.Add(QueryParameters, "MaterialId", value);
			}
		}

        public override ModifyCasterVideoResourceResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return ModifyCasterVideoResourceResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
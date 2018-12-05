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
using Aliyun.Acs.CloudPhoto.Transform;
using Aliyun.Acs.CloudPhoto.Transform.V20170711;
using System.Collections.Generic;

namespace Aliyun.Acs.CloudPhoto.Model.V20170711
{
    public class MergeFacesRequest : RpcAcsRequest<MergeFacesResponse>
    {
        public MergeFacesRequest()
            : base("CloudPhoto", "2017-07-11", "MergeFaces", "cloudphoto", "openAPI")
        {
			Protocol = ProtocolType.HTTPS;
        }

		private string libraryId;

		private long? targetFaceId;

		private string storeName;

		private List<long?> faceIds;

		public string LibraryId
		{
			get
			{
				return libraryId;
			}
			set	
			{
				libraryId = value;
				DictionaryUtil.Add(QueryParameters, "LibraryId", value);
			}
		}

		public long? TargetFaceId
		{
			get
			{
				return targetFaceId;
			}
			set	
			{
				targetFaceId = value;
				DictionaryUtil.Add(QueryParameters, "TargetFaceId", value.ToString());
			}
		}

		public string StoreName
		{
			get
			{
				return storeName;
			}
			set	
			{
				storeName = value;
				DictionaryUtil.Add(QueryParameters, "StoreName", value);
			}
		}

		public List<long?> FaceIds
		{
			get
			{
				return faceIds;
			}

			set
			{
				faceIds = value;
				for (int i = 0; i < faceIds.Count; i++)
				{
					DictionaryUtil.Add(QueryParameters,"FaceId." + (i + 1) , faceIds[i]);
				}
			}
		}

        public override MergeFacesResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return MergeFacesResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
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
using Aliyun.Acs.Core.Transform;
using Aliyun.Acs.CloudPhoto.Model.V20170711;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.CloudPhoto.Transform.V20170711
{
    public class GetThumbnailResponseUnmarshaller
    {
        public static GetThumbnailResponse Unmarshall(UnmarshallerContext context)
        {
			GetThumbnailResponse getThumbnailResponse = new GetThumbnailResponse();

			getThumbnailResponse.HttpResponse = context.HttpResponse;
			getThumbnailResponse.Code = context.StringValue("GetThumbnail.Code");
			getThumbnailResponse.Message = context.StringValue("GetThumbnail.Message");
			getThumbnailResponse.ThumbnailUrl = context.StringValue("GetThumbnail.ThumbnailUrl");
			getThumbnailResponse.RequestId = context.StringValue("GetThumbnail.RequestId");
			getThumbnailResponse.Action = context.StringValue("GetThumbnail.Action");
        
			return getThumbnailResponse;
        }
    }
}
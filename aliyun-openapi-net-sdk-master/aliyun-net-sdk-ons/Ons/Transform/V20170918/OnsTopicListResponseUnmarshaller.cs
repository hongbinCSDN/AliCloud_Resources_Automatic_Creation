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
using Aliyun.Acs.Ons.Model.V20170918;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Ons.Transform.V20170918
{
    public class OnsTopicListResponseUnmarshaller
    {
        public static OnsTopicListResponse Unmarshall(UnmarshallerContext context)
        {
			OnsTopicListResponse onsTopicListResponse = new OnsTopicListResponse();

			onsTopicListResponse.HttpResponse = context.HttpResponse;
			onsTopicListResponse.RequestId = context.StringValue("OnsTopicList.RequestId");
			onsTopicListResponse.HelpUrl = context.StringValue("OnsTopicList.HelpUrl");

			List<OnsTopicListResponse.OnsTopicList_PublishInfoDo> onsTopicListResponse_data = new List<OnsTopicListResponse.OnsTopicList_PublishInfoDo>();
			for (int i = 0; i < context.Length("OnsTopicList.Data.Length"); i++) {
				OnsTopicListResponse.OnsTopicList_PublishInfoDo publishInfoDo = new OnsTopicListResponse.OnsTopicList_PublishInfoDo();
				publishInfoDo.Id = context.LongValue("OnsTopicList.Data["+ i +"].Id");
				publishInfoDo.ChannelId = context.IntegerValue("OnsTopicList.Data["+ i +"].ChannelId");
				publishInfoDo.ChannelName = context.StringValue("OnsTopicList.Data["+ i +"].ChannelName");
				publishInfoDo.OnsRegionId = context.StringValue("OnsTopicList.Data["+ i +"].OnsRegionId");
				publishInfoDo.RegionName = context.StringValue("OnsTopicList.Data["+ i +"].RegionName");
				publishInfoDo.Topic = context.StringValue("OnsTopicList.Data["+ i +"].Topic");
				publishInfoDo.Owner = context.StringValue("OnsTopicList.Data["+ i +"].Owner");
				publishInfoDo.Relation = context.IntegerValue("OnsTopicList.Data["+ i +"].Relation");
				publishInfoDo.RelationName = context.StringValue("OnsTopicList.Data["+ i +"].RelationName");
				publishInfoDo.Status = context.IntegerValue("OnsTopicList.Data["+ i +"].Status");
				publishInfoDo.StatusName = context.StringValue("OnsTopicList.Data["+ i +"].StatusName");
				publishInfoDo.Appkey = context.StringValue("OnsTopicList.Data["+ i +"].Appkey");
				publishInfoDo.CreateTime = context.LongValue("OnsTopicList.Data["+ i +"].CreateTime");
				publishInfoDo.UpdateTime = context.LongValue("OnsTopicList.Data["+ i +"].UpdateTime");
				publishInfoDo.Remark = context.StringValue("OnsTopicList.Data["+ i +"].Remark");

				onsTopicListResponse_data.Add(publishInfoDo);
			}
			onsTopicListResponse.Data = onsTopicListResponse_data;
        
			return onsTopicListResponse;
        }
    }
}
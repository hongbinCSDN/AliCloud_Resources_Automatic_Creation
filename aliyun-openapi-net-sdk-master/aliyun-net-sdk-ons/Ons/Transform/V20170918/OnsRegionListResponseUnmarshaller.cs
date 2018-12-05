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
    public class OnsRegionListResponseUnmarshaller
    {
        public static OnsRegionListResponse Unmarshall(UnmarshallerContext context)
        {
			OnsRegionListResponse onsRegionListResponse = new OnsRegionListResponse();

			onsRegionListResponse.HttpResponse = context.HttpResponse;
			onsRegionListResponse.RequestId = context.StringValue("OnsRegionList.RequestId");
			onsRegionListResponse.HelpUrl = context.StringValue("OnsRegionList.HelpUrl");

			List<OnsRegionListResponse.OnsRegionList_RegionDo> onsRegionListResponse_data = new List<OnsRegionListResponse.OnsRegionList_RegionDo>();
			for (int i = 0; i < context.Length("OnsRegionList.Data.Length"); i++) {
				OnsRegionListResponse.OnsRegionList_RegionDo regionDo = new OnsRegionListResponse.OnsRegionList_RegionDo();
				regionDo.Id = context.LongValue("OnsRegionList.Data["+ i +"].Id");
				regionDo.OnsRegionId = context.StringValue("OnsRegionList.Data["+ i +"].OnsRegionId");
				regionDo.RegionName = context.StringValue("OnsRegionList.Data["+ i +"].RegionName");
				regionDo.ChannelId = context.IntegerValue("OnsRegionList.Data["+ i +"].ChannelId");
				regionDo.ChannelName = context.StringValue("OnsRegionList.Data["+ i +"].ChannelName");
				regionDo.CreateTime = context.LongValue("OnsRegionList.Data["+ i +"].CreateTime");
				regionDo.UpdateTime = context.LongValue("OnsRegionList.Data["+ i +"].UpdateTime");

				onsRegionListResponse_data.Add(regionDo);
			}
			onsRegionListResponse.Data = onsRegionListResponse_data;
        
			return onsRegionListResponse;
        }
    }
}
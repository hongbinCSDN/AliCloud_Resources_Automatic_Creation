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
using Aliyun.Acs.jarvis.Model.V20180206;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.jarvis.Transform.V20180206
{
    public class DescribeDdosDefenseInfoResponseUnmarshaller
    {
        public static DescribeDdosDefenseInfoResponse Unmarshall(UnmarshallerContext context)
        {
			DescribeDdosDefenseInfoResponse describeDdosDefenseInfoResponse = new DescribeDdosDefenseInfoResponse();

			describeDdosDefenseInfoResponse.HttpResponse = context.HttpResponse;
			describeDdosDefenseInfoResponse.RequestId = context.StringValue("DescribeDdosDefenseInfo.RequestId");
			describeDdosDefenseInfoResponse.Module = context.StringValue("DescribeDdosDefenseInfo.Module");
			describeDdosDefenseInfoResponse.BlackTimes = context.IntegerValue("DescribeDdosDefenseInfo.BlackTimes");
			describeDdosDefenseInfoResponse.Duration = context.IntegerValue("DescribeDdosDefenseInfo.Duration");
			describeDdosDefenseInfoResponse.BgpPkgState = context.StringValue("DescribeDdosDefenseInfo.BgpPkgState");

			List<DescribeDdosDefenseInfoResponse.DescribeDdosDefenseInfo_DdosDefenseThresholdItem> describeDdosDefenseInfoResponse_ddosDefenseThreshold = new List<DescribeDdosDefenseInfoResponse.DescribeDdosDefenseInfo_DdosDefenseThresholdItem>();
			for (int i = 0; i < context.Length("DescribeDdosDefenseInfo.DdosDefenseThreshold.Length"); i++) {
				DescribeDdosDefenseInfoResponse.DescribeDdosDefenseInfo_DdosDefenseThresholdItem ddosDefenseThresholdItem = new DescribeDdosDefenseInfoResponse.DescribeDdosDefenseInfo_DdosDefenseThresholdItem();
				ddosDefenseThresholdItem.RegionId = context.StringValue("DescribeDdosDefenseInfo.DdosDefenseThreshold["+ i +"].RegionId");
				ddosDefenseThresholdItem.CurrThreshold = context.IntegerValue("DescribeDdosDefenseInfo.DdosDefenseThreshold["+ i +"].CurrThreshold");
				ddosDefenseThresholdItem.RecommendThreshold = context.IntegerValue("DescribeDdosDefenseInfo.DdosDefenseThreshold["+ i +"].RecommendThreshold");

				describeDdosDefenseInfoResponse_ddosDefenseThreshold.Add(ddosDefenseThresholdItem);
			}
			describeDdosDefenseInfoResponse.DdosDefenseThreshold = describeDdosDefenseInfoResponse_ddosDefenseThreshold;
        
			return describeDdosDefenseInfoResponse;
        }
    }
}
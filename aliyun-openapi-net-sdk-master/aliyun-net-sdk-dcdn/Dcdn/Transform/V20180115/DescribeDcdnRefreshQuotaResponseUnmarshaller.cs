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
using Aliyun.Acs.dcdn.Model.V20180115;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.dcdn.Transform.V20180115
{
    public class DescribeDcdnRefreshQuotaResponseUnmarshaller
    {
        public static DescribeDcdnRefreshQuotaResponse Unmarshall(UnmarshallerContext context)
        {
			DescribeDcdnRefreshQuotaResponse describeDcdnRefreshQuotaResponse = new DescribeDcdnRefreshQuotaResponse();

			describeDcdnRefreshQuotaResponse.HttpResponse = context.HttpResponse;
			describeDcdnRefreshQuotaResponse.RequestId = context.StringValue("DescribeDcdnRefreshQuota.RequestId");
			describeDcdnRefreshQuotaResponse.UrlQuota = context.StringValue("DescribeDcdnRefreshQuota.UrlQuota");
			describeDcdnRefreshQuotaResponse.DirQuota = context.StringValue("DescribeDcdnRefreshQuota.DirQuota");
			describeDcdnRefreshQuotaResponse.UrlRemain = context.StringValue("DescribeDcdnRefreshQuota.UrlRemain");
			describeDcdnRefreshQuotaResponse.DirRemain = context.StringValue("DescribeDcdnRefreshQuota.DirRemain");
			describeDcdnRefreshQuotaResponse.PreloadQuota = context.StringValue("DescribeDcdnRefreshQuota.PreloadQuota");
			describeDcdnRefreshQuotaResponse.BlockQuota = context.StringValue("DescribeDcdnRefreshQuota.BlockQuota");
			describeDcdnRefreshQuotaResponse.PreloadRemain = context.StringValue("DescribeDcdnRefreshQuota.PreloadRemain");
			describeDcdnRefreshQuotaResponse.BlockRemain = context.StringValue("DescribeDcdnRefreshQuota.BlockRemain");
        
			return describeDcdnRefreshQuotaResponse;
        }
    }
}
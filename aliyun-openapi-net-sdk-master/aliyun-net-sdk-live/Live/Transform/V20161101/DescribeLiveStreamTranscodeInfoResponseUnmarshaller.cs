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
using Aliyun.Acs.live.Model.V20161101;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.live.Transform.V20161101
{
    public class DescribeLiveStreamTranscodeInfoResponseUnmarshaller
    {
        public static DescribeLiveStreamTranscodeInfoResponse Unmarshall(UnmarshallerContext context)
        {
			DescribeLiveStreamTranscodeInfoResponse describeLiveStreamTranscodeInfoResponse = new DescribeLiveStreamTranscodeInfoResponse();

			describeLiveStreamTranscodeInfoResponse.HttpResponse = context.HttpResponse;
			describeLiveStreamTranscodeInfoResponse.RequestId = context.StringValue("DescribeLiveStreamTranscodeInfo.RequestId");

			List<DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo> describeLiveStreamTranscodeInfoResponse_domainTranscodeList = new List<DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo>();
			for (int i = 0; i < context.Length("DescribeLiveStreamTranscodeInfo.DomainTranscodeList.Length"); i++) {
				DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo domainTranscodeInfo = new DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo();
				domainTranscodeInfo.TranscodeApp = context.StringValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].TranscodeApp");
				domainTranscodeInfo.TranscodeName = context.StringValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].TranscodeName");
				domainTranscodeInfo.TranscodeTemplate = context.StringValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].TranscodeTemplate");

				DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo.DescribeLiveStreamTranscodeInfo_CustomTranscodeParameters customTranscodeParameters = new DescribeLiveStreamTranscodeInfoResponse.DescribeLiveStreamTranscodeInfo_DomainTranscodeInfo.DescribeLiveStreamTranscodeInfo_CustomTranscodeParameters();
				customTranscodeParameters.VideoBitrate = context.IntegerValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].CustomTranscodeParameters.VideoBitrate");
				customTranscodeParameters.FPS = context.IntegerValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].CustomTranscodeParameters.FPS");
				customTranscodeParameters.Height = context.IntegerValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].CustomTranscodeParameters.Height");
				customTranscodeParameters.Width = context.IntegerValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].CustomTranscodeParameters.Width");
				customTranscodeParameters.TemplateType = context.StringValue("DescribeLiveStreamTranscodeInfo.DomainTranscodeList["+ i +"].CustomTranscodeParameters.TemplateType");
				domainTranscodeInfo.CustomTranscodeParameters = customTranscodeParameters;

				describeLiveStreamTranscodeInfoResponse_domainTranscodeList.Add(domainTranscodeInfo);
			}
			describeLiveStreamTranscodeInfoResponse.DomainTranscodeList = describeLiveStreamTranscodeInfoResponse_domainTranscodeList;
        
			return describeLiveStreamTranscodeInfoResponse;
        }
    }
}
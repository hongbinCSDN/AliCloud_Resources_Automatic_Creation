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
using Aliyun.Acs.Cdn.Model.V20141111;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Cdn.Transform.V20141111
{
    public class BatchDescribeDomainBpsDataResponseUnmarshaller
    {
        public static BatchDescribeDomainBpsDataResponse Unmarshall(UnmarshallerContext context)
        {
			BatchDescribeDomainBpsDataResponse batchDescribeDomainBpsDataResponse = new BatchDescribeDomainBpsDataResponse();

			batchDescribeDomainBpsDataResponse.HttpResponse = context.HttpResponse;
			batchDescribeDomainBpsDataResponse.RequestId = context.StringValue("BatchDescribeDomainBpsData.RequestId");
			batchDescribeDomainBpsDataResponse.PageNumber = context.IntegerValue("BatchDescribeDomainBpsData.PageNumber");
			batchDescribeDomainBpsDataResponse.PageSize = context.IntegerValue("BatchDescribeDomainBpsData.PageSize");
			batchDescribeDomainBpsDataResponse.TotalCount = context.IntegerValue("BatchDescribeDomainBpsData.TotalCount");

			List<BatchDescribeDomainBpsDataResponse.BatchDescribeDomainBpsData_DataModule> batchDescribeDomainBpsDataResponse_bpsDatas = new List<BatchDescribeDomainBpsDataResponse.BatchDescribeDomainBpsData_DataModule>();
			for (int i = 0; i < context.Length("BatchDescribeDomainBpsData.BpsDatas.Length"); i++) {
				BatchDescribeDomainBpsDataResponse.BatchDescribeDomainBpsData_DataModule dataModule = new BatchDescribeDomainBpsDataResponse.BatchDescribeDomainBpsData_DataModule();
				dataModule.Timestamp = context.StringValue("BatchDescribeDomainBpsData.BpsDatas["+ i +"].Timestamp");
				dataModule.L1Bps = context.FloatValue("BatchDescribeDomainBpsData.BpsDatas["+ i +"].L1Bps");
				dataModule.L1InnerBps = context.FloatValue("BatchDescribeDomainBpsData.BpsDatas["+ i +"].L1InnerBps");
				dataModule.L1OutBps = context.FloatValue("BatchDescribeDomainBpsData.BpsDatas["+ i +"].L1OutBps");
				dataModule.DomainName = context.StringValue("BatchDescribeDomainBpsData.BpsDatas["+ i +"].DomainName");

				batchDescribeDomainBpsDataResponse_bpsDatas.Add(dataModule);
			}
			batchDescribeDomainBpsDataResponse.BpsDatas = batchDescribeDomainBpsDataResponse_bpsDatas;
        
			return batchDescribeDomainBpsDataResponse;
        }
    }
}
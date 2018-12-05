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
    public class DescribeLiveSpecificDomainMappingResponseUnmarshaller
    {
        public static DescribeLiveSpecificDomainMappingResponse Unmarshall(UnmarshallerContext context)
        {
			DescribeLiveSpecificDomainMappingResponse describeLiveSpecificDomainMappingResponse = new DescribeLiveSpecificDomainMappingResponse();

			describeLiveSpecificDomainMappingResponse.HttpResponse = context.HttpResponse;
			describeLiveSpecificDomainMappingResponse.RequestId = context.StringValue("DescribeLiveSpecificDomainMapping.RequestId");

			List<DescribeLiveSpecificDomainMappingResponse.DescribeLiveSpecificDomainMapping_DomainMappingModel> describeLiveSpecificDomainMappingResponse_domainMappingModels = new List<DescribeLiveSpecificDomainMappingResponse.DescribeLiveSpecificDomainMapping_DomainMappingModel>();
			for (int i = 0; i < context.Length("DescribeLiveSpecificDomainMapping.DomainMappingModels.Length"); i++) {
				DescribeLiveSpecificDomainMappingResponse.DescribeLiveSpecificDomainMapping_DomainMappingModel domainMappingModel = new DescribeLiveSpecificDomainMappingResponse.DescribeLiveSpecificDomainMapping_DomainMappingModel();
				domainMappingModel.PushDomain = context.StringValue("DescribeLiveSpecificDomainMapping.DomainMappingModels["+ i +"].PushDomain");
				domainMappingModel.PullDomain = context.StringValue("DescribeLiveSpecificDomainMapping.DomainMappingModels["+ i +"].PullDomain");

				describeLiveSpecificDomainMappingResponse_domainMappingModels.Add(domainMappingModel);
			}
			describeLiveSpecificDomainMappingResponse.DomainMappingModels = describeLiveSpecificDomainMappingResponse_domainMappingModels;
        
			return describeLiveSpecificDomainMappingResponse;
        }
    }
}
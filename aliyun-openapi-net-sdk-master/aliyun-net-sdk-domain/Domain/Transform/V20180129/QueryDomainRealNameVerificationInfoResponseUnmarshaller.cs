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
using Aliyun.Acs.Domain.Model.V20180129;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Domain.Transform.V20180129
{
    public class QueryDomainRealNameVerificationInfoResponseUnmarshaller
    {
        public static QueryDomainRealNameVerificationInfoResponse Unmarshall(UnmarshallerContext context)
        {
			QueryDomainRealNameVerificationInfoResponse queryDomainRealNameVerificationInfoResponse = new QueryDomainRealNameVerificationInfoResponse();

			queryDomainRealNameVerificationInfoResponse.HttpResponse = context.HttpResponse;
			queryDomainRealNameVerificationInfoResponse.RequestId = context.StringValue("QueryDomainRealNameVerificationInfo.RequestId");
			queryDomainRealNameVerificationInfoResponse.SubmissionDate = context.StringValue("QueryDomainRealNameVerificationInfo.SubmissionDate");
			queryDomainRealNameVerificationInfoResponse.IdentityCredential = context.StringValue("QueryDomainRealNameVerificationInfo.IdentityCredential");
			queryDomainRealNameVerificationInfoResponse.IdentityCredentialNo = context.StringValue("QueryDomainRealNameVerificationInfo.IdentityCredentialNo");
			queryDomainRealNameVerificationInfoResponse.IdentityCredentialType = context.StringValue("QueryDomainRealNameVerificationInfo.IdentityCredentialType");
			queryDomainRealNameVerificationInfoResponse.DomainName = context.StringValue("QueryDomainRealNameVerificationInfo.DomainName");
			queryDomainRealNameVerificationInfoResponse.InstanceId = context.StringValue("QueryDomainRealNameVerificationInfo.InstanceId");
			queryDomainRealNameVerificationInfoResponse.IdentityCredentialUrl = context.StringValue("QueryDomainRealNameVerificationInfo.IdentityCredentialUrl");
        
			return queryDomainRealNameVerificationInfoResponse;
        }
    }
}
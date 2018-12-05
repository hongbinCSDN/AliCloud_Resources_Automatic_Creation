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
using Aliyun.Acs.Iot.Model.V20170420;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Iot.Transform.V20170420
{
    public class GetRuleActionResponseUnmarshaller
    {
        public static GetRuleActionResponse Unmarshall(UnmarshallerContext context)
        {
			GetRuleActionResponse getRuleActionResponse = new GetRuleActionResponse();

			getRuleActionResponse.HttpResponse = context.HttpResponse;
			getRuleActionResponse.RequestId = context.StringValue("GetRuleAction.RequestId");
			getRuleActionResponse.Success = context.BooleanValue("GetRuleAction.Success");
			getRuleActionResponse.ErrorMessage = context.StringValue("GetRuleAction.ErrorMessage");

			GetRuleActionResponse.GetRuleAction_RuleActionInfo ruleActionInfo = new GetRuleActionResponse.GetRuleAction_RuleActionInfo();
			ruleActionInfo.Id = context.LongValue("GetRuleAction.RuleActionInfo.Id");
			ruleActionInfo.RuleId = context.LongValue("GetRuleAction.RuleActionInfo.RuleId");
			ruleActionInfo.Type = context.StringValue("GetRuleAction.RuleActionInfo.Type");
			ruleActionInfo.Configuration = context.StringValue("GetRuleAction.RuleActionInfo.Configuration");
			getRuleActionResponse.RuleActionInfo = ruleActionInfo;
        
			return getRuleActionResponse;
        }
    }
}
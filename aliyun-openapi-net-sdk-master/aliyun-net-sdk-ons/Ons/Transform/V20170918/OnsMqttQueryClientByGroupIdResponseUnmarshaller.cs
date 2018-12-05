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
    public class OnsMqttQueryClientByGroupIdResponseUnmarshaller
    {
        public static OnsMqttQueryClientByGroupIdResponse Unmarshall(UnmarshallerContext context)
        {
			OnsMqttQueryClientByGroupIdResponse onsMqttQueryClientByGroupIdResponse = new OnsMqttQueryClientByGroupIdResponse();

			onsMqttQueryClientByGroupIdResponse.HttpResponse = context.HttpResponse;
			onsMqttQueryClientByGroupIdResponse.RequestId = context.StringValue("OnsMqttQueryClientByGroupId.RequestId");
			onsMqttQueryClientByGroupIdResponse.HelpUrl = context.StringValue("OnsMqttQueryClientByGroupId.HelpUrl");

			OnsMqttQueryClientByGroupIdResponse.OnsMqttQueryClientByGroupId_MqttClientSetDo mqttClientSetDo = new OnsMqttQueryClientByGroupIdResponse.OnsMqttQueryClientByGroupId_MqttClientSetDo();
			mqttClientSetDo.OnlineCount = context.LongValue("OnsMqttQueryClientByGroupId.MqttClientSetDo.OnlineCount");
			mqttClientSetDo.PersistCount = context.LongValue("OnsMqttQueryClientByGroupId.MqttClientSetDo.PersistCount");
			onsMqttQueryClientByGroupIdResponse.MqttClientSetDo = mqttClientSetDo;
        
			return onsMqttQueryClientByGroupIdResponse;
        }
    }
}
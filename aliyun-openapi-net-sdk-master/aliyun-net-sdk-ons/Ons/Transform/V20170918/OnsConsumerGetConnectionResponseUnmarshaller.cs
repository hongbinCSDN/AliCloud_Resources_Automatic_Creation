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
    public class OnsConsumerGetConnectionResponseUnmarshaller
    {
        public static OnsConsumerGetConnectionResponse Unmarshall(UnmarshallerContext context)
        {
			OnsConsumerGetConnectionResponse onsConsumerGetConnectionResponse = new OnsConsumerGetConnectionResponse();

			onsConsumerGetConnectionResponse.HttpResponse = context.HttpResponse;
			onsConsumerGetConnectionResponse.RequestId = context.StringValue("OnsConsumerGetConnection.RequestId");
			onsConsumerGetConnectionResponse.HelpUrl = context.StringValue("OnsConsumerGetConnection.HelpUrl");

			OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data data = new OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data();

			List<OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data.OnsConsumerGetConnection_ConnectionDo> data_connectionList = new List<OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data.OnsConsumerGetConnection_ConnectionDo>();
			for (int i = 0; i < context.Length("OnsConsumerGetConnection.Data.ConnectionList.Length"); i++) {
				OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data.OnsConsumerGetConnection_ConnectionDo connectionDo = new OnsConsumerGetConnectionResponse.OnsConsumerGetConnection_Data.OnsConsumerGetConnection_ConnectionDo();
				connectionDo.ClientId = context.StringValue("OnsConsumerGetConnection.Data.ConnectionList["+ i +"].ClientId");
				connectionDo.ClientAddr = context.StringValue("OnsConsumerGetConnection.Data.ConnectionList["+ i +"].ClientAddr");
				connectionDo.Language = context.StringValue("OnsConsumerGetConnection.Data.ConnectionList["+ i +"].Language");
				connectionDo.Version = context.StringValue("OnsConsumerGetConnection.Data.ConnectionList["+ i +"].Version");

				data_connectionList.Add(connectionDo);
			}
			data.ConnectionList = data_connectionList;
			onsConsumerGetConnectionResponse.Data = data;
        
			return onsConsumerGetConnectionResponse;
        }
    }
}
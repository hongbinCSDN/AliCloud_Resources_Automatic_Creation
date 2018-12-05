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
using Aliyun.Acs.Push.Model.V20160801;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Push.Transform.V20160801
{
    public class CheckDevicesResponseUnmarshaller
    {
        public static CheckDevicesResponse Unmarshall(UnmarshallerContext context)
        {
			CheckDevicesResponse checkDevicesResponse = new CheckDevicesResponse();

			checkDevicesResponse.HttpResponse = context.HttpResponse;
			checkDevicesResponse.RequestId = context.StringValue("CheckDevices.RequestId");

			List<CheckDevicesResponse.CheckDevices_DeviceCheckInfo> checkDevicesResponse_deviceCheckInfos = new List<CheckDevicesResponse.CheckDevices_DeviceCheckInfo>();
			for (int i = 0; i < context.Length("CheckDevices.DeviceCheckInfos.Length"); i++) {
				CheckDevicesResponse.CheckDevices_DeviceCheckInfo deviceCheckInfo = new CheckDevicesResponse.CheckDevices_DeviceCheckInfo();
				deviceCheckInfo.DeviceId = context.StringValue("CheckDevices.DeviceCheckInfos["+ i +"].DeviceId");
				deviceCheckInfo.Available = context.BooleanValue("CheckDevices.DeviceCheckInfos["+ i +"].Available");

				checkDevicesResponse_deviceCheckInfos.Add(deviceCheckInfo);
			}
			checkDevicesResponse.DeviceCheckInfos = checkDevicesResponse_deviceCheckInfos;
        
			return checkDevicesResponse;
        }
    }
}
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
using Aliyun.Acs.Kms.Model.V20160120;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Kms.Transform.V20160120
{
    public class ListKeysResponseUnmarshaller
    {
        public static ListKeysResponse Unmarshall(UnmarshallerContext context)
        {
			ListKeysResponse listKeysResponse = new ListKeysResponse();

			listKeysResponse.HttpResponse = context.HttpResponse;
			listKeysResponse.TotalCount = context.IntegerValue("ListKeys.TotalCount");
			listKeysResponse.PageNumber = context.IntegerValue("ListKeys.PageNumber");
			listKeysResponse.PageSize = context.IntegerValue("ListKeys.PageSize");
			listKeysResponse.RequestId = context.StringValue("ListKeys.RequestId");

			List<ListKeysResponse.ListKeys_Key> listKeysResponse_keys = new List<ListKeysResponse.ListKeys_Key>();
			for (int i = 0; i < context.Length("ListKeys.Keys.Length"); i++) {
				ListKeysResponse.ListKeys_Key key = new ListKeysResponse.ListKeys_Key();
				key.KeyId = context.StringValue("ListKeys.Keys["+ i +"].KeyId");
				key.KeyArn = context.StringValue("ListKeys.Keys["+ i +"].KeyArn");

				listKeysResponse_keys.Add(key);
			}
			listKeysResponse.Keys = listKeysResponse_keys;
        
			return listKeysResponse;
        }
    }
}
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
using Aliyun.Acs.Iot.Model.V20180120;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Iot.Transform.V20180120
{
    public class QueryProductResponseUnmarshaller
    {
        public static QueryProductResponse Unmarshall(UnmarshallerContext context)
        {
			QueryProductResponse queryProductResponse = new QueryProductResponse();

			queryProductResponse.HttpResponse = context.HttpResponse;
			queryProductResponse.RequestId = context.StringValue("QueryProduct.RequestId");
			queryProductResponse.Success = context.BooleanValue("QueryProduct.Success");
			queryProductResponse.ErrorMessage = context.StringValue("QueryProduct.ErrorMessage");

			QueryProductResponse.QueryProduct_Data data = new QueryProductResponse.QueryProduct_Data();
			data.GmtCreate = context.StringValue("QueryProduct.Data.GmtCreate");
			data.DataFormat = context.IntegerValue("QueryProduct.Data.DataFormat");
			data.Description = context.StringValue("QueryProduct.Data.Description");
			data.DeviceCount = context.IntegerValue("QueryProduct.Data.DeviceCount");
			data.NodeType = context.IntegerValue("QueryProduct.Data.NodeType");
			data.ProductKey = context.StringValue("QueryProduct.Data.ProductKey");
			data.ProductName = context.StringValue("QueryProduct.Data.ProductName");
			queryProductResponse.Data = data;
        
			return queryProductResponse;
        }
    }
}
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
    public class GenerateDataKeyResponseUnmarshaller
    {
        public static GenerateDataKeyResponse Unmarshall(UnmarshallerContext context)
        {
			GenerateDataKeyResponse generateDataKeyResponse = new GenerateDataKeyResponse();

			generateDataKeyResponse.HttpResponse = context.HttpResponse;
			generateDataKeyResponse.CiphertextBlob = context.StringValue("GenerateDataKey.CiphertextBlob");
			generateDataKeyResponse.KeyId = context.StringValue("GenerateDataKey.KeyId");
			generateDataKeyResponse.Plaintext = context.StringValue("GenerateDataKey.Plaintext");
			generateDataKeyResponse.RequestId = context.StringValue("GenerateDataKey.RequestId");
        
			return generateDataKeyResponse;
        }
    }
}
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
    public class DescribeKeyResponseUnmarshaller
    {
        public static DescribeKeyResponse Unmarshall(UnmarshallerContext context)
        {
			DescribeKeyResponse describeKeyResponse = new DescribeKeyResponse();

			describeKeyResponse.HttpResponse = context.HttpResponse;
			describeKeyResponse.RequestId = context.StringValue("DescribeKey.RequestId");

			DescribeKeyResponse.DescribeKey_KeyMetadata keyMetadata = new DescribeKeyResponse.DescribeKey_KeyMetadata();
			keyMetadata.CreationDate = context.StringValue("DescribeKey.KeyMetadata.CreationDate");
			keyMetadata.Description = context.StringValue("DescribeKey.KeyMetadata.Description");
			keyMetadata.KeyId = context.StringValue("DescribeKey.KeyMetadata.KeyId");
			keyMetadata.KeyState = context.StringValue("DescribeKey.KeyMetadata.KeyState");
			keyMetadata.KeyUsage = context.StringValue("DescribeKey.KeyMetadata.KeyUsage");
			keyMetadata.DeleteDate = context.StringValue("DescribeKey.KeyMetadata.DeleteDate");
			keyMetadata.Creator = context.StringValue("DescribeKey.KeyMetadata.Creator");
			keyMetadata.Arn = context.StringValue("DescribeKey.KeyMetadata.Arn");
			keyMetadata.Origin = context.StringValue("DescribeKey.KeyMetadata.Origin");
			keyMetadata.MaterialExpireTime = context.StringValue("DescribeKey.KeyMetadata.MaterialExpireTime");
			describeKeyResponse.KeyMetadata = keyMetadata;
        
			return describeKeyResponse;
        }
    }
}
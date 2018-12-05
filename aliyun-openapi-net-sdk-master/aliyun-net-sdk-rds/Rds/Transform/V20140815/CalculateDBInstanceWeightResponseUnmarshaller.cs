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
using Aliyun.Acs.Rds.Model.V20140815;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Rds.Transform.V20140815
{
    public class CalculateDBInstanceWeightResponseUnmarshaller
    {
        public static CalculateDBInstanceWeightResponse Unmarshall(UnmarshallerContext context)
        {
			CalculateDBInstanceWeightResponse calculateDBInstanceWeightResponse = new CalculateDBInstanceWeightResponse();

			calculateDBInstanceWeightResponse.HttpResponse = context.HttpResponse;
			calculateDBInstanceWeightResponse.RequestId = context.StringValue("CalculateDBInstanceWeight.RequestId");

			List<CalculateDBInstanceWeightResponse.CalculateDBInstanceWeight_DBInstanceWeight> calculateDBInstanceWeightResponse_items = new List<CalculateDBInstanceWeightResponse.CalculateDBInstanceWeight_DBInstanceWeight>();
			for (int i = 0; i < context.Length("CalculateDBInstanceWeight.Items.Length"); i++) {
				CalculateDBInstanceWeightResponse.CalculateDBInstanceWeight_DBInstanceWeight dBInstanceWeight = new CalculateDBInstanceWeightResponse.CalculateDBInstanceWeight_DBInstanceWeight();
				dBInstanceWeight.DBInstanceId = context.StringValue("CalculateDBInstanceWeight.Items["+ i +"].DBInstanceId");
				dBInstanceWeight.DBInstanceType = context.StringValue("CalculateDBInstanceWeight.Items["+ i +"].DBInstanceType");
				dBInstanceWeight.Availability = context.StringValue("CalculateDBInstanceWeight.Items["+ i +"].Availability");
				dBInstanceWeight.Weight = context.StringValue("CalculateDBInstanceWeight.Items["+ i +"].Weight");

				calculateDBInstanceWeightResponse_items.Add(dBInstanceWeight);
			}
			calculateDBInstanceWeightResponse.Items = calculateDBInstanceWeightResponse_items;
        
			return calculateDBInstanceWeightResponse;
        }
    }
}
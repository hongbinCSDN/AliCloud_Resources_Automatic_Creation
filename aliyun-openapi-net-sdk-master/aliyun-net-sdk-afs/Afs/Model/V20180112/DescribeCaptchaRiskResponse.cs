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
using Aliyun.Acs.Core;
using System.Collections.Generic;

namespace Aliyun.Acs.afs.Model.V20180112
{
	public class DescribeCaptchaRiskResponse : AcsResponse
	{

		private string requestId;

		private string bizCode;

		private int? numOfThisMonth;

		private int? numOfLastMonth;

		private string riskLevel;

		public string RequestId
		{
			get
			{
				return requestId;
			}
			set	
			{
				requestId = value;
			}
		}

		public string BizCode
		{
			get
			{
				return bizCode;
			}
			set	
			{
				bizCode = value;
			}
		}

		public int? NumOfThisMonth
		{
			get
			{
				return numOfThisMonth;
			}
			set	
			{
				numOfThisMonth = value;
			}
		}

		public int? NumOfLastMonth
		{
			get
			{
				return numOfLastMonth;
			}
			set	
			{
				numOfLastMonth = value;
			}
		}

		public string RiskLevel
		{
			get
			{
				return riskLevel;
			}
			set	
			{
				riskLevel = value;
			}
		}
	}
}
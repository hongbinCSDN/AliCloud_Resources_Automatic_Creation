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

namespace Aliyun.Acs.aegis.Model.V20161111
{
	public class DescribeStrategyTargetResponse : AcsResponse
	{

		private string requestId;

		private int? count;

		private List<DescribeStrategyTarget_StringItem> strategyTargets;

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

		public int? Count
		{
			get
			{
				return count;
			}
			set	
			{
				count = value;
			}
		}

		public List<DescribeStrategyTarget_StringItem> StrategyTargets
		{
			get
			{
				return strategyTargets;
			}
			set	
			{
				strategyTargets = value;
			}
		}

		public class DescribeStrategyTarget_StringItem
		{

			private string flag;

			private string target;

			private string targetType;

			public string Flag
			{
				get
				{
					return flag;
				}
				set	
				{
					flag = value;
				}
			}

			public string Target
			{
				get
				{
					return target;
				}
				set	
				{
					target = value;
				}
			}

			public string TargetType
			{
				get
				{
					return targetType;
				}
				set	
				{
					targetType = value;
				}
			}
		}
	}
}
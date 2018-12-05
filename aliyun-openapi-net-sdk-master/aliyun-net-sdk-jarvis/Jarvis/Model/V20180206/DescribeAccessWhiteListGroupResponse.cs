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

namespace Aliyun.Acs.jarvis.Model.V20180206
{
	public class DescribeAccessWhiteListGroupResponse : AcsResponse
	{

		private string requestId;

		private string module;

		private List<DescribeAccessWhiteListGroup_Data> dataList;

		private DescribeAccessWhiteListGroup_PageInfo pageInfo;

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

		public string Module
		{
			get
			{
				return module;
			}
			set	
			{
				module = value;
			}
		}

		public List<DescribeAccessWhiteListGroup_Data> DataList
		{
			get
			{
				return dataList;
			}
			set	
			{
				dataList = value;
			}
		}

		public DescribeAccessWhiteListGroup_PageInfo PageInfo
		{
			get
			{
				return pageInfo;
			}
			set	
			{
				pageInfo = value;
			}
		}

		public class DescribeAccessWhiteListGroup_Data
		{

			private string status;

			private string gmtCreate;

			private string gmtRealExpire;

			private string srcIP;

			private int? autoConfig;

			private int? groupId;

			private List<DescribeAccessWhiteListGroup_Item> items;

			public string Status
			{
				get
				{
					return status;
				}
				set	
				{
					status = value;
				}
			}

			public string GmtCreate
			{
				get
				{
					return gmtCreate;
				}
				set	
				{
					gmtCreate = value;
				}
			}

			public string GmtRealExpire
			{
				get
				{
					return gmtRealExpire;
				}
				set	
				{
					gmtRealExpire = value;
				}
			}

			public string SrcIP
			{
				get
				{
					return srcIP;
				}
				set	
				{
					srcIP = value;
				}
			}

			public int? AutoConfig
			{
				get
				{
					return autoConfig;
				}
				set	
				{
					autoConfig = value;
				}
			}

			public int? GroupId
			{
				get
				{
					return groupId;
				}
				set	
				{
					groupId = value;
				}
			}

			public List<DescribeAccessWhiteListGroup_Item> Items
			{
				get
				{
					return items;
				}
				set	
				{
					items = value;
				}
			}

			public class DescribeAccessWhiteListGroup_Item
			{

				private string iP;

				private string regionId;

				public string IP
				{
					get
					{
						return iP;
					}
					set	
					{
						iP = value;
					}
				}

				public string RegionId
				{
					get
					{
						return regionId;
					}
					set	
					{
						regionId = value;
					}
				}
			}
		}

		public class DescribeAccessWhiteListGroup_PageInfo
		{

			private int? total;

			private int? pageSize;

			private int? currentPage;

			public int? Total
			{
				get
				{
					return total;
				}
				set	
				{
					total = value;
				}
			}

			public int? PageSize
			{
				get
				{
					return pageSize;
				}
				set	
				{
					pageSize = value;
				}
			}

			public int? CurrentPage
			{
				get
				{
					return currentPage;
				}
				set	
				{
					currentPage = value;
				}
			}
		}
	}
}
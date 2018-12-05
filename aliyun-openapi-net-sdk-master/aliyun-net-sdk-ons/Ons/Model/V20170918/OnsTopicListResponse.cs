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

namespace Aliyun.Acs.Ons.Model.V20170918
{
	public class OnsTopicListResponse : AcsResponse
	{

		private string requestId;

		private string helpUrl;

		private List<OnsTopicList_PublishInfoDo> data;

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

		public string HelpUrl
		{
			get
			{
				return helpUrl;
			}
			set	
			{
				helpUrl = value;
			}
		}

		public List<OnsTopicList_PublishInfoDo> Data
		{
			get
			{
				return data;
			}
			set	
			{
				data = value;
			}
		}

		public class OnsTopicList_PublishInfoDo
		{

			private long? id;

			private int? channelId;

			private string channelName;

			private string onsRegionId;

			private string regionName;

			private string topic;

			private string owner;

			private int? relation;

			private string relationName;

			private int? status;

			private string statusName;

			private string appkey;

			private long? createTime;

			private long? updateTime;

			private string remark;

			public long? Id
			{
				get
				{
					return id;
				}
				set	
				{
					id = value;
				}
			}

			public int? ChannelId
			{
				get
				{
					return channelId;
				}
				set	
				{
					channelId = value;
				}
			}

			public string ChannelName
			{
				get
				{
					return channelName;
				}
				set	
				{
					channelName = value;
				}
			}

			public string OnsRegionId
			{
				get
				{
					return onsRegionId;
				}
				set	
				{
					onsRegionId = value;
				}
			}

			public string RegionName
			{
				get
				{
					return regionName;
				}
				set	
				{
					regionName = value;
				}
			}

			public string Topic
			{
				get
				{
					return topic;
				}
				set	
				{
					topic = value;
				}
			}

			public string Owner
			{
				get
				{
					return owner;
				}
				set	
				{
					owner = value;
				}
			}

			public int? Relation
			{
				get
				{
					return relation;
				}
				set	
				{
					relation = value;
				}
			}

			public string RelationName
			{
				get
				{
					return relationName;
				}
				set	
				{
					relationName = value;
				}
			}

			public int? Status
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

			public string StatusName
			{
				get
				{
					return statusName;
				}
				set	
				{
					statusName = value;
				}
			}

			public string Appkey
			{
				get
				{
					return appkey;
				}
				set	
				{
					appkey = value;
				}
			}

			public long? CreateTime
			{
				get
				{
					return createTime;
				}
				set	
				{
					createTime = value;
				}
			}

			public long? UpdateTime
			{
				get
				{
					return updateTime;
				}
				set	
				{
					updateTime = value;
				}
			}

			public string Remark
			{
				get
				{
					return remark;
				}
				set	
				{
					remark = value;
				}
			}
		}
	}
}
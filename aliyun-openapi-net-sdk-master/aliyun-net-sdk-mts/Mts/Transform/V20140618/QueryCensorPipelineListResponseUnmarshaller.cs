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
using Aliyun.Acs.Mts.Model.V20140618;
using System;
using System.Collections.Generic;

namespace Aliyun.Acs.Mts.Transform.V20140618
{
    public class QueryCensorPipelineListResponseUnmarshaller
    {
        public static QueryCensorPipelineListResponse Unmarshall(UnmarshallerContext context)
        {
			QueryCensorPipelineListResponse queryCensorPipelineListResponse = new QueryCensorPipelineListResponse();

			queryCensorPipelineListResponse.HttpResponse = context.HttpResponse;
			queryCensorPipelineListResponse.RequestId = context.StringValue("QueryCensorPipelineList.RequestId");

			List<string> queryCensorPipelineListResponse_nonExistIds = new List<string>();
			for (int i = 0; i < context.Length("QueryCensorPipelineList.NonExistIds.Length"); i++) {
				queryCensorPipelineListResponse_nonExistIds.Add(context.StringValue("QueryCensorPipelineList.NonExistIds["+ i +"]"));
			}
			queryCensorPipelineListResponse.NonExistIds = queryCensorPipelineListResponse_nonExistIds;

			List<QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline> queryCensorPipelineListResponse_pipelineList = new List<QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline>();
			for (int i = 0; i < context.Length("QueryCensorPipelineList.PipelineList.Length"); i++) {
				QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline pipeline = new QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline();
				pipeline.Id = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].Id");
				pipeline.Name = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].Name");
				pipeline.State = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].State");
				pipeline.Priority = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].Priority");

				QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline.QueryCensorPipelineList_NotifyConfig notifyConfig = new QueryCensorPipelineListResponse.QueryCensorPipelineList_Pipeline.QueryCensorPipelineList_NotifyConfig();
				notifyConfig.Topic = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].NotifyConfig.Topic");
				notifyConfig.Queue = context.StringValue("QueryCensorPipelineList.PipelineList["+ i +"].NotifyConfig.Queue");
				pipeline.NotifyConfig = notifyConfig;

				queryCensorPipelineListResponse_pipelineList.Add(pipeline);
			}
			queryCensorPipelineListResponse.PipelineList = queryCensorPipelineListResponse_pipelineList;
        
			return queryCensorPipelineListResponse;
        }
    }
}
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

namespace Aliyun.Acs.CSB.Model.V20171118
{
	public class GetServiceResponse : AcsResponse
	{

		private int? code;

		private string message;

		private string requestId;

		private GetService_Data data;

		public int? Code
		{
			get
			{
				return code;
			}
			set	
			{
				code = value;
			}
		}

		public string Message
		{
			get
			{
				return message;
			}
			set	
			{
				message = value;
			}
		}

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

		public GetService_Data Data
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

		public class GetService_Data
		{

			private GetService_Service service;

			public GetService_Service Service
			{
				get
				{
					return service;
				}
				set	
				{
					service = value;
				}
			}

			public class GetService_Service
			{

				private string accessParamsJSON;

				private bool? active;

				private string alias;

				private bool? allVisiable;

				private string approveUserId;

				private string casTargets;

				private string consumeTypesJSON;

				private long? createTime;

				private long? csbId;

				private string errDefJSON;

				private long? id;

				private string interfaceName;

				private string ipBlackStr;

				private string ipWhiteStr;

				private string modelVersion;

				private long? modifiedTime;

				private string oldVersion;

				private string openRestfulPath;

				private bool? ottFlag;

				private string ownerId;

				private string policyHandler;

				private string principalName;

				private long? projectId;

				private string projectName;

				private string provideType;

				private string routeConfJson;

				private bool? sSL;

				private string scope;

				private string serviceName;

				private string serviceOpenRestfulPath;

				private string serviceProviderType;

				private string serviceVersion;

				private bool? skipAuth;

				private string statisticName;

				private int? status;

				private string userId;

				private bool? validConsumeTypes;

				private bool? validProvideType;

				private List<GetService_ServiceVersion> serviceVersionsList;

				private List<GetService_VisiableGroup> visiableGroupList;

				private List<string> casServTargets;

				private List<string> consumeTypes;

				private GetService_RouteConf routeConf;

				public string AccessParamsJSON
				{
					get
					{
						return accessParamsJSON;
					}
					set	
					{
						accessParamsJSON = value;
					}
				}

				public bool? Active
				{
					get
					{
						return active;
					}
					set	
					{
						active = value;
					}
				}

				public string Alias
				{
					get
					{
						return alias;
					}
					set	
					{
						alias = value;
					}
				}

				public bool? AllVisiable
				{
					get
					{
						return allVisiable;
					}
					set	
					{
						allVisiable = value;
					}
				}

				public string ApproveUserId
				{
					get
					{
						return approveUserId;
					}
					set	
					{
						approveUserId = value;
					}
				}

				public string CasTargets
				{
					get
					{
						return casTargets;
					}
					set	
					{
						casTargets = value;
					}
				}

				public string ConsumeTypesJSON
				{
					get
					{
						return consumeTypesJSON;
					}
					set	
					{
						consumeTypesJSON = value;
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

				public long? CsbId
				{
					get
					{
						return csbId;
					}
					set	
					{
						csbId = value;
					}
				}

				public string ErrDefJSON
				{
					get
					{
						return errDefJSON;
					}
					set	
					{
						errDefJSON = value;
					}
				}

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

				public string InterfaceName
				{
					get
					{
						return interfaceName;
					}
					set	
					{
						interfaceName = value;
					}
				}

				public string IpBlackStr
				{
					get
					{
						return ipBlackStr;
					}
					set	
					{
						ipBlackStr = value;
					}
				}

				public string IpWhiteStr
				{
					get
					{
						return ipWhiteStr;
					}
					set	
					{
						ipWhiteStr = value;
					}
				}

				public string ModelVersion
				{
					get
					{
						return modelVersion;
					}
					set	
					{
						modelVersion = value;
					}
				}

				public long? ModifiedTime
				{
					get
					{
						return modifiedTime;
					}
					set	
					{
						modifiedTime = value;
					}
				}

				public string OldVersion
				{
					get
					{
						return oldVersion;
					}
					set	
					{
						oldVersion = value;
					}
				}

				public string OpenRestfulPath
				{
					get
					{
						return openRestfulPath;
					}
					set	
					{
						openRestfulPath = value;
					}
				}

				public bool? OttFlag
				{
					get
					{
						return ottFlag;
					}
					set	
					{
						ottFlag = value;
					}
				}

				public string OwnerId
				{
					get
					{
						return ownerId;
					}
					set	
					{
						ownerId = value;
					}
				}

				public string PolicyHandler
				{
					get
					{
						return policyHandler;
					}
					set	
					{
						policyHandler = value;
					}
				}

				public string PrincipalName
				{
					get
					{
						return principalName;
					}
					set	
					{
						principalName = value;
					}
				}

				public long? ProjectId
				{
					get
					{
						return projectId;
					}
					set	
					{
						projectId = value;
					}
				}

				public string ProjectName
				{
					get
					{
						return projectName;
					}
					set	
					{
						projectName = value;
					}
				}

				public string ProvideType
				{
					get
					{
						return provideType;
					}
					set	
					{
						provideType = value;
					}
				}

				public string RouteConfJson
				{
					get
					{
						return routeConfJson;
					}
					set	
					{
						routeConfJson = value;
					}
				}

				public bool? SSL
				{
					get
					{
						return sSL;
					}
					set	
					{
						sSL = value;
					}
				}

				public string Scope
				{
					get
					{
						return scope;
					}
					set	
					{
						scope = value;
					}
				}

				public string ServiceName
				{
					get
					{
						return serviceName;
					}
					set	
					{
						serviceName = value;
					}
				}

				public string ServiceOpenRestfulPath
				{
					get
					{
						return serviceOpenRestfulPath;
					}
					set	
					{
						serviceOpenRestfulPath = value;
					}
				}

				public string ServiceProviderType
				{
					get
					{
						return serviceProviderType;
					}
					set	
					{
						serviceProviderType = value;
					}
				}

				public string ServiceVersion
				{
					get
					{
						return serviceVersion;
					}
					set	
					{
						serviceVersion = value;
					}
				}

				public bool? SkipAuth
				{
					get
					{
						return skipAuth;
					}
					set	
					{
						skipAuth = value;
					}
				}

				public string StatisticName
				{
					get
					{
						return statisticName;
					}
					set	
					{
						statisticName = value;
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

				public string UserId
				{
					get
					{
						return userId;
					}
					set	
					{
						userId = value;
					}
				}

				public bool? ValidConsumeTypes
				{
					get
					{
						return validConsumeTypes;
					}
					set	
					{
						validConsumeTypes = value;
					}
				}

				public bool? ValidProvideType
				{
					get
					{
						return validProvideType;
					}
					set	
					{
						validProvideType = value;
					}
				}

				public List<GetService_ServiceVersion> ServiceVersionsList
				{
					get
					{
						return serviceVersionsList;
					}
					set	
					{
						serviceVersionsList = value;
					}
				}

				public List<GetService_VisiableGroup> VisiableGroupList
				{
					get
					{
						return visiableGroupList;
					}
					set	
					{
						visiableGroupList = value;
					}
				}

				public List<string> CasServTargets
				{
					get
					{
						return casServTargets;
					}
					set	
					{
						casServTargets = value;
					}
				}

				public List<string> ConsumeTypes
				{
					get
					{
						return consumeTypes;
					}
					set	
					{
						consumeTypes = value;
					}
				}

				public GetService_RouteConf RouteConf
				{
					get
					{
						return routeConf;
					}
					set	
					{
						routeConf = value;
					}
				}

				public class GetService_ServiceVersion
				{

					private bool? active;

					private bool? allVisiable;

					private long? id;

					private string oldVersion;

					private bool? ottFlag;

					private bool? sSL;

					private string scope;

					private string serviceVersion;

					private bool? skipAuth;

					private string statisticName;

					private int? status;

					private bool? validConsumeTypes;

					private bool? validProvideType;

					public bool? Active
					{
						get
						{
							return active;
						}
						set	
						{
							active = value;
						}
					}

					public bool? AllVisiable
					{
						get
						{
							return allVisiable;
						}
						set	
						{
							allVisiable = value;
						}
					}

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

					public string OldVersion
					{
						get
						{
							return oldVersion;
						}
						set	
						{
							oldVersion = value;
						}
					}

					public bool? OttFlag
					{
						get
						{
							return ottFlag;
						}
						set	
						{
							ottFlag = value;
						}
					}

					public bool? SSL
					{
						get
						{
							return sSL;
						}
						set	
						{
							sSL = value;
						}
					}

					public string Scope
					{
						get
						{
							return scope;
						}
						set	
						{
							scope = value;
						}
					}

					public string ServiceVersion
					{
						get
						{
							return serviceVersion;
						}
						set	
						{
							serviceVersion = value;
						}
					}

					public bool? SkipAuth
					{
						get
						{
							return skipAuth;
						}
						set	
						{
							skipAuth = value;
						}
					}

					public string StatisticName
					{
						get
						{
							return statisticName;
						}
						set	
						{
							statisticName = value;
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

					public bool? ValidConsumeTypes
					{
						get
						{
							return validConsumeTypes;
						}
						set	
						{
							validConsumeTypes = value;
						}
					}

					public bool? ValidProvideType
					{
						get
						{
							return validProvideType;
						}
						set	
						{
							validProvideType = value;
						}
					}
				}

				public class GetService_VisiableGroup
				{

					private long? id;

					private long? groupId;

					private string userId;

					private long? serviceId;

					private long? createTime;

					private long? modifiedTime;

					private int? status;

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

					public long? GroupId
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

					public string UserId
					{
						get
						{
							return userId;
						}
						set	
						{
							userId = value;
						}
					}

					public long? ServiceId
					{
						get
						{
							return serviceId;
						}
						set	
						{
							serviceId = value;
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

					public long? ModifiedTime
					{
						get
						{
							return modifiedTime;
						}
						set	
						{
							modifiedTime = value;
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
				}

				public class GetService_RouteConf
				{

					private string serviceRouteStrategy;

					private GetService_ImportConf importConf;

					private GetService_ImportConfs importConfs;

					public string ServiceRouteStrategy
					{
						get
						{
							return serviceRouteStrategy;
						}
						set	
						{
							serviceRouteStrategy = value;
						}
					}

					public GetService_ImportConf ImportConf
					{
						get
						{
							return importConf;
						}
						set	
						{
							importConf = value;
						}
					}

					public GetService_ImportConfs ImportConfs
					{
						get
						{
							return importConfs;
						}
						set	
						{
							importConfs = value;
						}
					}

					public class GetService_ImportConf
					{

						private string accessEndpointJSON;

						private string provideType;

						private List<GetService_InputParameter> inputParameterMap;

						private List<GetService_OutputParameter> outputParameterMap;

						public string AccessEndpointJSON
						{
							get
							{
								return accessEndpointJSON;
							}
							set	
							{
								accessEndpointJSON = value;
							}
						}

						public string ProvideType
						{
							get
							{
								return provideType;
							}
							set	
							{
								provideType = value;
							}
						}

						public List<GetService_InputParameter> InputParameterMap
						{
							get
							{
								return inputParameterMap;
							}
							set	
							{
								inputParameterMap = value;
							}
						}

						public List<GetService_OutputParameter> OutputParameterMap
						{
							get
							{
								return outputParameterMap;
							}
							set	
							{
								outputParameterMap = value;
							}
						}

						public class GetService_InputParameter
						{

							private int? catType;

							private int? depth;

							private int? extType;

							private int? mapStyle;

							private bool? optional;

							private string originalName;

							private string paramType;

							private string passMethod;

							private string targetName;

							public int? CatType
							{
								get
								{
									return catType;
								}
								set	
								{
									catType = value;
								}
							}

							public int? Depth
							{
								get
								{
									return depth;
								}
								set	
								{
									depth = value;
								}
							}

							public int? ExtType
							{
								get
								{
									return extType;
								}
								set	
								{
									extType = value;
								}
							}

							public int? MapStyle
							{
								get
								{
									return mapStyle;
								}
								set	
								{
									mapStyle = value;
								}
							}

							public bool? Optional
							{
								get
								{
									return optional;
								}
								set	
								{
									optional = value;
								}
							}

							public string OriginalName
							{
								get
								{
									return originalName;
								}
								set	
								{
									originalName = value;
								}
							}

							public string ParamType
							{
								get
								{
									return paramType;
								}
								set	
								{
									paramType = value;
								}
							}

							public string PassMethod
							{
								get
								{
									return passMethod;
								}
								set	
								{
									passMethod = value;
								}
							}

							public string TargetName
							{
								get
								{
									return targetName;
								}
								set	
								{
									targetName = value;
								}
							}
						}

						public class GetService_OutputParameter
						{

							private int? catType;

							private int? depth;

							private int? extType;

							private int? mapStyle;

							private bool? optional;

							private string originalName;

							private string paramType;

							private string passMethod;

							private string targetName;

							public int? CatType
							{
								get
								{
									return catType;
								}
								set	
								{
									catType = value;
								}
							}

							public int? Depth
							{
								get
								{
									return depth;
								}
								set	
								{
									depth = value;
								}
							}

							public int? ExtType
							{
								get
								{
									return extType;
								}
								set	
								{
									extType = value;
								}
							}

							public int? MapStyle
							{
								get
								{
									return mapStyle;
								}
								set	
								{
									mapStyle = value;
								}
							}

							public bool? Optional
							{
								get
								{
									return optional;
								}
								set	
								{
									optional = value;
								}
							}

							public string OriginalName
							{
								get
								{
									return originalName;
								}
								set	
								{
									originalName = value;
								}
							}

							public string ParamType
							{
								get
								{
									return paramType;
								}
								set	
								{
									paramType = value;
								}
							}

							public string PassMethod
							{
								get
								{
									return passMethod;
								}
								set	
								{
									passMethod = value;
								}
							}

							public string TargetName
							{
								get
								{
									return targetName;
								}
								set	
								{
									targetName = value;
								}
							}
						}
					}

					public class GetService_ImportConfs
					{

						private string accessEndpointJSON;

						private string provideType;

						private List<GetService_InputParameter3> inputParameterMap1;

						private List<GetService_OutputParameter4> outputParameterMap2;

						public string AccessEndpointJSON
						{
							get
							{
								return accessEndpointJSON;
							}
							set	
							{
								accessEndpointJSON = value;
							}
						}

						public string ProvideType
						{
							get
							{
								return provideType;
							}
							set	
							{
								provideType = value;
							}
						}

						public List<GetService_InputParameter3> InputParameterMap1
						{
							get
							{
								return inputParameterMap1;
							}
							set	
							{
								inputParameterMap1 = value;
							}
						}

						public List<GetService_OutputParameter4> OutputParameterMap2
						{
							get
							{
								return outputParameterMap2;
							}
							set	
							{
								outputParameterMap2 = value;
							}
						}

						public class GetService_InputParameter3
						{

							private int? catType;

							private int? depth;

							private int? extType;

							private int? mapStyle;

							private bool? optional;

							private string originalName;

							private string paramType;

							private string passMethod;

							private string targetName;

							public int? CatType
							{
								get
								{
									return catType;
								}
								set	
								{
									catType = value;
								}
							}

							public int? Depth
							{
								get
								{
									return depth;
								}
								set	
								{
									depth = value;
								}
							}

							public int? ExtType
							{
								get
								{
									return extType;
								}
								set	
								{
									extType = value;
								}
							}

							public int? MapStyle
							{
								get
								{
									return mapStyle;
								}
								set	
								{
									mapStyle = value;
								}
							}

							public bool? Optional
							{
								get
								{
									return optional;
								}
								set	
								{
									optional = value;
								}
							}

							public string OriginalName
							{
								get
								{
									return originalName;
								}
								set	
								{
									originalName = value;
								}
							}

							public string ParamType
							{
								get
								{
									return paramType;
								}
								set	
								{
									paramType = value;
								}
							}

							public string PassMethod
							{
								get
								{
									return passMethod;
								}
								set	
								{
									passMethod = value;
								}
							}

							public string TargetName
							{
								get
								{
									return targetName;
								}
								set	
								{
									targetName = value;
								}
							}
						}

						public class GetService_OutputParameter4
						{

							private int? catType;

							private int? depth;

							private int? extType;

							private int? mapStyle;

							private bool? optional;

							private string originalName;

							private string paramType;

							private string passMethod;

							private string targetName;

							public int? CatType
							{
								get
								{
									return catType;
								}
								set	
								{
									catType = value;
								}
							}

							public int? Depth
							{
								get
								{
									return depth;
								}
								set	
								{
									depth = value;
								}
							}

							public int? ExtType
							{
								get
								{
									return extType;
								}
								set	
								{
									extType = value;
								}
							}

							public int? MapStyle
							{
								get
								{
									return mapStyle;
								}
								set	
								{
									mapStyle = value;
								}
							}

							public bool? Optional
							{
								get
								{
									return optional;
								}
								set	
								{
									optional = value;
								}
							}

							public string OriginalName
							{
								get
								{
									return originalName;
								}
								set	
								{
									originalName = value;
								}
							}

							public string ParamType
							{
								get
								{
									return paramType;
								}
								set	
								{
									paramType = value;
								}
							}

							public string PassMethod
							{
								get
								{
									return passMethod;
								}
								set	
								{
									passMethod = value;
								}
							}

							public string TargetName
							{
								get
								{
									return targetName;
								}
								set	
								{
									targetName = value;
								}
							}
						}
					}
				}
			}
		}
	}
}
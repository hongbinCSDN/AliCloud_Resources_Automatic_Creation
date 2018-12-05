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
using Aliyun.Acs.Core.Http;
using Aliyun.Acs.Core.Transform;
using Aliyun.Acs.Core.Utils;
using Aliyun.Acs.Domain.Transform;
using Aliyun.Acs.Domain.Transform.V20180129;
using System.Collections.Generic;

namespace Aliyun.Acs.Domain.Model.V20180129
{
    public class SaveBatchTaskForCreatingOrderActivateRequest : RpcAcsRequest<SaveBatchTaskForCreatingOrderActivateResponse>
    {
        public SaveBatchTaskForCreatingOrderActivateRequest()
            : base("Domain", "2018-01-29", "SaveBatchTaskForCreatingOrderActivate")
        {
        }

		private List<OrderActivateParam> orderActivateParams;

		private string userClientIp;

		private string lang;

		public List<OrderActivateParam> OrderActivateParams
		{
			get
			{
				return orderActivateParams;
			}

			set
			{
				orderActivateParams = value;
				for (int i = 0; i < orderActivateParams.Count; i++)
				{
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".DomainName", orderActivateParams[i].DomainName);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".SubscriptionDuration", orderActivateParams[i].SubscriptionDuration);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".RegistrantProfileId", orderActivateParams[i].RegistrantProfileId);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".EnableDomainProxy", orderActivateParams[i].EnableDomainProxy);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".PermitPremiumActivation", orderActivateParams[i].PermitPremiumActivation);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".AliyunDns", orderActivateParams[i].AliyunDns);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Dns1", orderActivateParams[i].Dns1);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Dns2", orderActivateParams[i].Dns2);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".ZhCity", orderActivateParams[i].ZhCity);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".ZhRegistrantOrganization", orderActivateParams[i].ZhRegistrantOrganization);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Country", orderActivateParams[i].Country);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".ZhRegistrantName", orderActivateParams[i].ZhRegistrantName);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".ZhProvince", orderActivateParams[i].ZhProvince);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".ZhAddress", orderActivateParams[i].ZhAddress);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".City", orderActivateParams[i].City);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".RegistrantOrganization", orderActivateParams[i].RegistrantOrganization);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".RegistrantName", orderActivateParams[i].RegistrantName);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Province", orderActivateParams[i].Province);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Address", orderActivateParams[i].Address);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Email", orderActivateParams[i].Email);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".PostalCode", orderActivateParams[i].PostalCode);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".TelArea", orderActivateParams[i].TelArea);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".Telephone", orderActivateParams[i].Telephone);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".TelExt", orderActivateParams[i].TelExt);
					DictionaryUtil.Add(QueryParameters,"OrderActivateParam." + (i + 1) + ".RegistrantType", orderActivateParams[i].RegistrantType);
				}
			}
		}

		public string UserClientIp
		{
			get
			{
				return userClientIp;
			}
			set	
			{
				userClientIp = value;
				DictionaryUtil.Add(QueryParameters, "UserClientIp", value);
			}
		}

		public string Lang
		{
			get
			{
				return lang;
			}
			set	
			{
				lang = value;
				DictionaryUtil.Add(QueryParameters, "Lang", value);
			}
		}

		public class OrderActivateParam
		{

			private string domainName;

			private int? subscriptionDuration;

			private long? registrantProfileId;

			private bool? enableDomainProxy;

			private bool? permitPremiumActivation;

			private bool? aliyunDns;

			private string dns1;

			private string dns2;

			private string zhCity;

			private string zhRegistrantOrganization;

			private string country;

			private string zhRegistrantName;

			private string zhProvince;

			private string zhAddress;

			private string city;

			private string registrantOrganization;

			private string registrantName;

			private string province;

			private string address;

			private string email;

			private string postalCode;

			private string telArea;

			private string telephone;

			private string telExt;

			private string registrantType;

			public string DomainName
			{
				get
				{
					return domainName;
				}
				set	
				{
					domainName = value;
				}
			}

			public int? SubscriptionDuration
			{
				get
				{
					return subscriptionDuration;
				}
				set	
				{
					subscriptionDuration = value;
				}
			}

			public long? RegistrantProfileId
			{
				get
				{
					return registrantProfileId;
				}
				set	
				{
					registrantProfileId = value;
				}
			}

			public bool? EnableDomainProxy
			{
				get
				{
					return enableDomainProxy;
				}
				set	
				{
					enableDomainProxy = value;
				}
			}

			public bool? PermitPremiumActivation
			{
				get
				{
					return permitPremiumActivation;
				}
				set	
				{
					permitPremiumActivation = value;
				}
			}

			public bool? AliyunDns
			{
				get
				{
					return aliyunDns;
				}
				set	
				{
					aliyunDns = value;
				}
			}

			public string Dns1
			{
				get
				{
					return dns1;
				}
				set	
				{
					dns1 = value;
				}
			}

			public string Dns2
			{
				get
				{
					return dns2;
				}
				set	
				{
					dns2 = value;
				}
			}

			public string ZhCity
			{
				get
				{
					return zhCity;
				}
				set	
				{
					zhCity = value;
				}
			}

			public string ZhRegistrantOrganization
			{
				get
				{
					return zhRegistrantOrganization;
				}
				set	
				{
					zhRegistrantOrganization = value;
				}
			}

			public string Country
			{
				get
				{
					return country;
				}
				set	
				{
					country = value;
				}
			}

			public string ZhRegistrantName
			{
				get
				{
					return zhRegistrantName;
				}
				set	
				{
					zhRegistrantName = value;
				}
			}

			public string ZhProvince
			{
				get
				{
					return zhProvince;
				}
				set	
				{
					zhProvince = value;
				}
			}

			public string ZhAddress
			{
				get
				{
					return zhAddress;
				}
				set	
				{
					zhAddress = value;
				}
			}

			public string City
			{
				get
				{
					return city;
				}
				set	
				{
					city = value;
				}
			}

			public string RegistrantOrganization
			{
				get
				{
					return registrantOrganization;
				}
				set	
				{
					registrantOrganization = value;
				}
			}

			public string RegistrantName
			{
				get
				{
					return registrantName;
				}
				set	
				{
					registrantName = value;
				}
			}

			public string Province
			{
				get
				{
					return province;
				}
				set	
				{
					province = value;
				}
			}

			public string Address
			{
				get
				{
					return address;
				}
				set	
				{
					address = value;
				}
			}

			public string Email
			{
				get
				{
					return email;
				}
				set	
				{
					email = value;
				}
			}

			public string PostalCode
			{
				get
				{
					return postalCode;
				}
				set	
				{
					postalCode = value;
				}
			}

			public string TelArea
			{
				get
				{
					return telArea;
				}
				set	
				{
					telArea = value;
				}
			}

			public string Telephone
			{
				get
				{
					return telephone;
				}
				set	
				{
					telephone = value;
				}
			}

			public string TelExt
			{
				get
				{
					return telExt;
				}
				set	
				{
					telExt = value;
				}
			}

			public string RegistrantType
			{
				get
				{
					return registrantType;
				}
				set	
				{
					registrantType = value;
				}
			}
		}

		public override bool CheckShowJsonItemName()
		{
			return false;
		}

        public override SaveBatchTaskForCreatingOrderActivateResponse GetResponse(Core.Transform.UnmarshallerContext unmarshallerContext)
        {
            return SaveBatchTaskForCreatingOrderActivateResponseUnmarshaller.Unmarshall(unmarshallerContext);
        }
    }
}
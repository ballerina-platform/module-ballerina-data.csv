// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

final boolean b1 = true;
final false b2 = false;
final boolean? b3 = ();
final boolean|int b4 = false;

final () n1 = ();
final int? n2 = ();
final () n3 = null;

final int i1 = 1;
final map<boolean> bm1 = {b1, b2};
final map<boolean?> bm2 = {b1, b2, b3, n1, n3};
final map<boolean|int?> bm3 = {b1, b2, b3, b4, i1};
final map<()> bm4 = {n1, n3};
final map<boolean?> bm5 = {b1, b2, b3, b4:true};

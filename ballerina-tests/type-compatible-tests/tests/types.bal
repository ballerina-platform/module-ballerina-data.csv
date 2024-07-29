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

type AnydataArray1 anydata[];
type CustomRecord27 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata a1;
    json j1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    string...;
|};
type AnydataMap map<anydata>;
type JsonMap map<json>;
type StringMap map<string>;
type CustomTuple7 [int, string, boolean, (), float, decimal, json, anydata, string...];

type AnydataArray1Array AnydataArray1[];
type CustomRecord27Array CustomRecord27[];
type AnydataMapArray AnydataMap[];
type JsonMapArray JsonMap[];
type StringMapArray StringMap[];
type CustomTuple7Array CustomTuple7[];

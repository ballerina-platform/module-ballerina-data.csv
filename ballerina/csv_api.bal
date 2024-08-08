// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/jballerina.java;

public isolated function parseString(string csvString, ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

public isolated function parseBytes(byte[] csvBytes, ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

public isolated function parseStream(stream<byte[], error?> csvByteStream,
           ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

public isolated function transform(record{}[] csvRecords,
           TransformOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

public isolated function parseList(string[][] csvList, ParseListOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

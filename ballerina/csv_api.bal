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

# Converts CSV string to subtype of `record{}[]` or `anydata[][]`.
#
# + csvString - Source CSV string value
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `csv:Error` value.
public isolated function parseString(string csvString, ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

# Converts byte[] to subtype of `record{}[]` or `anydata[][]`.
#
# + csvBytes - Source CSV byte array
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `csv:Error` value.
public isolated function parseBytes(byte[] csvBytes, ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

# Converts CSV byte-block-stream to subtype of `record{}[]` or `anydata[][]`.
#
# + csvByteStream - Source CSV byte-block-stream
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `csv:Error` value.
public isolated function parseStream(stream<byte[], error?> csvByteStream,
           ParseOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

# Convert value of type record{}[] to subtype of `record{}[]` or `anydata[][]`.
#
# + csvRecords - Source Ballerina record array value
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, returns value belonging to the given target type, else returns an `csv:Error` value.
public isolated function transform(record{}[] csvRecords,
           TransformOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

# Convert value of type string array of array to subtype of `record{}[]` or `anydata[][]`.
#
# + csvList - Source Ballerina string array of array value
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, returns value belonging to the given target type, else returns an `csv:Error` value.
public isolated function parseList(string[][] csvList, ParseListOptions options = {}, typedesc<record{}[]|anydata[][]> t = <>)
     returns t|Error = @java:Method {'class: "io.ballerina.lib.data.csvdata.csv.Native"} external;

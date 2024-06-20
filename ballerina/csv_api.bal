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

public isolated function parseStringToRecord(string s, parseToRecordOption options = {}, typedesc<record{}[]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseBytesToRecord(byte[] s, parseToRecordOption options = {}, typedesc<record{}[]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseStreamToRecord(stream<byte[], error?> s,
            parseToRecordOption options = {}, typedesc<record{}[]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseStringToList(string s, ParseOption options = {}, typedesc<anydata[][]> t = <>)
       returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseBytesToList(byte[] s, ParseOption options = {}, typedesc<anydata[][]> t = <>)
       returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseStreamToList(stream<byte[], error?> s,
            ParseOption options = {}, typedesc<anydata[][]> t = <>)
       returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseRecordAsRecordType(record{}[] s,
            RecordAsRecordOption options = {}, typedesc<record{}[]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseRecordAsListType(record{}[] s, string[] headerNames,
            Options options = {}, typedesc<anydata[][]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseListAsRecordType(string[][] s, string[]? customHeaders = (),
            ListAsRecordOption options = {}, typedesc<record{}[]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function parseListAsListType(string[][] s, ListAsListOption options = {}, typedesc<anydata[][]> t = <>)
      returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

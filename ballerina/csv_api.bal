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

type CsvConversionError error;

public enum OrderType {
    ASC,
    DESC
};

public type ColumnOrder record {|
    int|string column;
    OrderType columnOrder = ASC;
|};

public type MappingConfig record {|
    string keyValueSeparator = ":";
    string elementSeparator = ";";
|};

public type FromCSVConfig record {|
    int startNumber = 0;
    int headerStartNumber = 0;
    int dataStartNumber = 0;
    boolean headers = true;
    string:Char escapeCharacter = "\\";
    boolean ignoreEmptyLines = true;
    string:Char separator = ",";
    string quote = "\"";
    boolean skipHeaders = false;
    int skipdataRows = 0;
    int dataRowCount = -1;
    ColumnOrder|ColumnOrder[] orderBy = [];
    string|int|string[]|int[]? skipColumns = ();
    string[]|int[]? customheader = ();
    boolean suppressEscaping = false;
    MappingConfig mappingConfig = {};
    anydata nullValue = ();
    string? root = ();
|};

public type ToCSVConfig record {|
    string[]? headers = ();
    string:Char separator = ",";
    boolean skipHeaders = false;
    int skipdataRows = 0;
    int dataRowCount = -1;
    ColumnOrder|ColumnOrder[] orderBy = [];
    string|int|string[]|int[]? skipColumns = ();
    boolean suppressEscaping = false;
    MappingConfig mappingConfig = {};
    anydata nullValue = ();
    string:Char escapeCharacter = "\\";
|};

public isolated function fromCsvWithType((string[]|map<anydata>|record{})[] value, FromCSVConfig config, typedesc<(record{}|map<anydata>|anydata[])[]> t = <>)
    returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function fromCsvStringWithType(string|byte[]|stream<byte[], error?> s,
        FromCSVConfig config,typedesc<(record{}|map<anydata>|anydata)[]> t = <>)
    returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function toCsv(anydata[] value, ToCSVConfig config) returns (string|map<anydata>|record{})[]|CsvConversionError {
    return error("");
}

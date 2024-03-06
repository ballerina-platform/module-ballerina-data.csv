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
type UnSupportedOperation error;

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
    int startNumber = 0; // done
    int headerStartNumber = 0; // done
    int dataStartNumber = 1; // done
    boolean headers = true; // done
    string:Char escapeCharacter = "\\";
    boolean ignoreEmptyLines = true; // done
    string:Char separator = ","; // done
    string quote = "\"";
    boolean skipHeaders = false; // done
    int skipdataRows = 0; // done
    int dataRowCount = -1; // done
    ColumnOrder|ColumnOrder[]? orderBy = (); // done
    string|int|string[]|int[]? skipColumns = ();
    string[]|int[]? customheader = (); // done
    boolean suppressEscaping = false;
    // MappingConfig mappingConfig = {};
    anydata nullValue = (); // done
|};

public type ToCSVConfig record {|
    string[]? headers = ();
    string:Char separator = ",";
    string:Char lineSeparator = "\n";
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

public isolated function fromCsvWithType((string[]|map<anydata>|record{})[] csv, FromCSVConfig config = {}, typedesc<(record{}|map<anydata>|anydata[])[]> t = <>)
    returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function fromCsvStringWithType(string|byte[]|stream<byte[], error?> s,
        FromCSVConfig config = {} ,typedesc<(record{}|map<anydata>|anydata)[]> t = <>)
    returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function toCsv((anydata[]|map<anydata>|record{})[] csv, ToCSVConfig config = {}, typedesc<(record{}|map<anydata>|anydata[])[]> t = <>) 
    returns t|CsvConversionError = @java:Method {'class: "io.ballerina.stdlib.data.csvdata.csv.Native"} external;

public isolated function toCsvString((anydata[]|map<anydata>|record{})[] csv, ToCSVConfig config = {}) returns string|UnSupportedOperation {
    string csvString = "";
    foreach anydata[]|map<anydata>|record{} row in csv {
        if row is anydata[] {
            foreach anydata cell in row {
                csvString += check convertToString(cell) + config.separator;
            }
            csvString = removeLastIndex(csvString);
            csvString += config.lineSeparator;
            continue;
        } 

        // issue: https://github.com/ballerina-platform/ballerina-lang/issues/42172
        foreach string cell in (<record {}>row).keys() {
            csvString += check convertToString(row[cell]) + config.separator;
        }

        csvString = removeLastIndex(csvString);
        csvString += config.lineSeparator;
    }

    csvString = removeLastIndex(csvString);
    return csvString;
}

isolated function removeLastIndex(string content) returns string {
    return content.substring(0, content.length() - 1);
}

isolated function convertToString(anydata cell) returns string|UnSupportedOperation {
    if cell is int|string|boolean|float|decimal|() {
        return cell.toBalString();
    } else {
        return error UnSupportedOperation(string `unsupported opration`);
    }
}

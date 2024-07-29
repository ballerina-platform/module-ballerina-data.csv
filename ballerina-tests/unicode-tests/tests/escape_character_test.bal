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

import ballerina/data.csv;
import ballerina/test;

@test:Config
function testEscapedCharactres() returns error? {
    string csvString = string `a, b
                            quote\"\"quoted\"quote, 1
                            backslash\\backslash, 2
                            newline\nnewline, 3
                            tab\ttab, 5
                            unicode\u0061unicode, 6
                            slash\/slash, 9
                            quoted string \\'abc\\', 10`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertEquals(rec, [
        {a: string `quote""quoted"quote`, b: 1},
        {a: string `backslash${"\\"}backslash`, b: 2},
        {a: string `newline${"\n"}newline`, b: 3},
        {a: string `tab${"\t"}tab`, b: 5},
        {a: string `unicodeaunicode`, b: 6},
        {a: string `slash/slash`, b: 9},
        {a: string `quoted string \'abc\'`, b: 10}
    ]);
}

@test:Config
function testEscapedCharactres2() returns error? {
    string csvString = string `a, b
                            backspace\bbackspace, 7`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertTrue(rec is record{string a; int b;}[]);
}

@test:Config
function testEscapedCharactres3() returns error? {
    string csvString = string ` a c, b
                            carriage return\r carriage return, 4`;
    
    record{}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertEquals(rec, [
        {"a c": string `carriage return${"\r"} carriage return`, b: 4}
    ]);
}

@test:Config
function testEscapedCharactres4() returns error? {
    string csvString = string `a, b
                            form feed\f form feed, 8`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertTrue(rec is record {string a; int b;}[]);
    // TODO: Add tests after supports \f by Ballerina
}

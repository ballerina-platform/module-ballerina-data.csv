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

// Valid parser options
final csv:ParseOptions option1 = {delimiter: "@", nilValue: "null", lineTerminator: [csv:LF]};
final csv:ParseOptions option2 = {nilValue: "N/A", lineTerminator: [csv:CRLF, csv:LF], comment: "/"};
final csv:ParseOptions option3 = {nilValue: "()", header: 1, skipLines: [1, 2]};
final csv:ParseOptions option4 = {nilValue: "", header: 4, skipLines: "1-5"};
final csv:ParseOptions option5 = {nilValue: "", header: 4, skipLines: "1-1"};
final csv:ParseOptions option6 = {nilValue: "()", header: false, skipLines: [1, 2]};

final csv:ParseOptions ptOption1 = {nilValue: "", header: 1, skipLines: [2, 4]};
final csv:ParseOptions ptOption2 = {nilValue: "", header: 1, skipLines: "2-4"};
final csv:ParseOptions ptOption3 = {nilValue: "", header: 4, skipLines: "1-5"};
final csv:ParseOptions ptOption4 = {nilValue: "", header: 4, skipLines: [-1, -2, 4, 2]};
final csv:ParseOptions ptOption5 = {header: false, skipLines: [-1, -2, 5, 3]};

// Invalid parser options
final csv:ParseOptions invalidParserOptions1 = {header: 4};
final csv:ParseOptions invalidParserOptions2 = {comment: "$"};
final csv:ParseOptions invalidParserOptions3 = {lineTerminator: csv:CRLF};
final csv:ParseOptions invalidParserOptions4 = {skipLines: [1000, 1001]};
final csv:ParseOptions invalidParserOptions5 = {skipLines: "a-b"};
final csv:ParseOptions invalidParserOptions6 = {skipLines: "3-1"};
final csv:ParseOptions invalidParserOptions7 = {skipLines: "a-5"};
final csv:ParseOptions invalidParserOptions8 = {skipLines: "6-a"};
final csv:ParseOptions invalidParserOptions9 = {skipLines: "a-5"};
final csv:ParseOptions invalidParserOptions10 = {skipLines: "-1-6"};
final csv:ParseOptions invalidParserOptions11 = {nilValue: "", header: 4, skipLines: "0-10"};
final csv:ParseOptions invalidParserOptions12 = {skipLines: [1, 3, 4, -1]};

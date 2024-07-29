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

public function generateErrorMessageForMissingRequiredField(string 'field) returns string {
    return string `no matching header value is found for the required field '${'field}'`;
}

public function generateErrorMessageForInvalidCast(string value, string 'type) returns string {
    return string `value '${value}' cannot be cast into '${'type}'`;
}

public function generateErrorMessageForInvalidFieldType(string value, string 'key) returns string {
    return string `no mapping type found for value '${value}' in key '${'key}'`;
}

public function generateErrorMessageForInvalidValueForArrayType(string value, string index, string arrayType) returns string {
    return string `value '${value}' in index '${index}' is not compatible with array type '${arrayType}'`;
}

public function generateErrorMessageForInvalidHeaders(string value, string 'type) returns string{
    return string `value '${value}' cannot be cast into '${'type}', because fields in '${'type}' or the provided expected headers are not matching with the '${value}'`;
}

public function generateErrorMessageForInvalidCustomHeader(string header) returns string{
    return string `Invalid header value: '${header}'`;
}

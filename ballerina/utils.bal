// Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
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

import ballerina/log;

# Print an error message to the log with error level.
# 
# + msg - The message to be logged
# + 'error - The error struct to be logged
# + stackTrace - The error stack trace to be logged
# + keyValues - The key-value pairs to be logged
function printError(string|log:PrintableRawTemplate msg, error? 'error = (), 
                    error:StackFrame[]? stackTrace = (), *log:KeyValues keyValues) {
     return log:printError(msg, 'error, stackTrace, keyValues);
}

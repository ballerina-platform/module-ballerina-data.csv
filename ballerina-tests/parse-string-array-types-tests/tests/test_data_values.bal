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

boolean b1 = true;
false b2 = false;
boolean|int b4 = false;

string csvStringWithBooleanValues1 = string `b1,b2,b3,b4
true,false,true,false 
true,false, true,false
true,false,true,false
`;

string csvStringWithBooleanValues2 = string `b1,b2,b3,b4,b5
true,false, true,false,true
true,false, true,false,true`;

string csvStringWithBooleanValues3 = string `b1,b2,b3
${" "}${"\t"}
true, false,true
${" "}
    TRUE, FALSE,()
${" "}

true, true,FALSE
 
`;

string csvStringWithBooleanValues4 = string `b1,b2,b3,b4
    true,(), (),false
 true,(), null,false

`;

string csvStringWithBooleanValues5 = string `b1,b2,b3,b4

true,false,true,2

true,false,true,3
`;

string csvStringWithBooleanValues6 = string `b2,b3
(),()

`;

string csvStringWithBooleanValues7 = string `b1,b2,b3,b4
${b1},${b2},(),${b4}
`;

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

import ballerina/csv_commons as common;
import ballerina/data.csv;
import ballerina/test;

@test:Config
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType() {
    BooleanRecord1Array|csv:Error csvb1br1 = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(csvb1br1, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord1Array|csv:Error csvb2br1 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br1, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord1Array|csv:Error csvb3br1 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertTrue(csvb3br1 is csv:Error);
    test:assertEquals((<csv:Error>csvb3br1).message(), common:generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|csv:Error csvb4br1 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br1, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord1Array|csv:Error csvb5br1 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br1 is csv:Error);
    test:assertEquals((<csv:Error>csvb5br1).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord1Array|csv:Error csvb6br1 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br1 is csv:Error);
    test:assertEquals((<csv:Error>csvb6br1).message(), common:generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|csv:Error csvb7br1 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br1, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord2Array|csv:Error csvb1br2 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|csv:Error csvb2br2 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|csv:Error csvb3br2 = csv:parseString(csvStringWithBooleanValues3);
    test:assertTrue(csvb3br2 is csv:Error);
    test:assertEquals((<csv:Error>csvb3br2).message(), common:generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|csv:Error csvb4br2 = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(csvb4br2, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord2Array|csv:Error csvb5br2 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br2 is csv:Error);
    test:assertEquals((<csv:Error>csvb5br2).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord2Array|csv:Error csvb7br2 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br2, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord3Array|csv:Error csvb1br3 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br3, [
        {b1: true, b3: true},
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|csv:Error csvb2br3 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|csv:Error csvb3br3 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br3, [
        {b1: true, b3: true},
        {b1: true, b3: ()},
        {b1: true, b3: false}
    ]);

    BooleanRecord3Array|csv:Error csvb4br3 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|csv:Error csvb5br3 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType2() {
    BooleanRecord3Array|csv:Error csvb7br3 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br3, [
        {b1, b3: ()}
    ]);

    BooleanRecord4Array|csv:Error csvb1br4 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br4, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord4Array|csv:Error csvb2br4 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br4, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord4Array|csv:Error csvb3br4 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br4, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord4Array|csv:Error csvb4br4 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br4, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord4Array|csv:Error csvb5br4 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br4, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    BooleanRecord4Array|csv:Error csvb7br4 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br4, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord5Array|csv:Error csvb1br5 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br5, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|csv:Error csvb2br5 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br5, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|csv:Error csvb3br5 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br5, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|csv:Error csvb4br5 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br5, [
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|csv:Error csvb5br5 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br5, [
        {b1: true, b2: false, b3: true, b4: 2, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: 3, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|csv:Error csvb7br5 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br5, [
        {b1, b2, b3: (), b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error csvb1br6 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error csvb2br6 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error csvb3br6 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: false, defaultableField: "", nillableField: ()}
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType3() {
    BooleanRecord6Array|csv:Error csvb4br6 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error csvb5br6 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error csvb7br6 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br6, [
        {b1, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|csv:Error csvb1br7 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br7 is csv:Error);
    test:assertEquals((<csv:Error>csvb1br7).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|csv:Error csvb1br8 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br8 is csv:Error);
    test:assertEquals((<csv:Error>csvb1br8).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord9Array|csv:Error csvb1br9 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br9, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord9Array|csv:Error csvb2br9 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br9, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord9Array|csv:Error csvb3br9 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord9Array|csv:Error csvb4br9 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br9, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord9Array|csv:Error csvb5br9 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord9Array|csv:Error csvb6br9 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br9 is csv:Error);
    test:assertEquals((<csv:Error>csvb6br9).message(), common:generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord9Array|csv:Error csvb7br9 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br9, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord10Array|csv:Error csvb1br10 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br10, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord10Array|csv:Error csvb2br10 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br10, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord10Array|csv:Error csvb3br10 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord10Array|csv:Error csvb4br10 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br10, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanRecord10Array|csv:Error csvb5br10 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord10Array|csv:Error csvb6br10 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br10, [
        {}
    ]);

    BooleanRecord10Array|csv:Error csvb7br10 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br10, [
        {b1, b2, b4}
    ]);

    BooleanRecord11Array|csv:Error csvb1br11 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br11, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType4() {
    BooleanRecord11Array|csv:Error csvb2br11 = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(csvb2br11, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|csv:Error csvb3br11 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br11, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|csv:Error csvb4br11 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br11, [
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|csv:Error csvb5br11 = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(csvb5br11, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|csv:Error csvb6br11 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br11 is csv:Error);
    test:assertEquals((<csv:Error>csvb6br11).message(), common:generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|csv:Error csvb7br11 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br11, [
        {b1, b2, b3, b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord12Array|csv:Error csvb1br12 = csv:parseString(csvStringWithBooleanValues1);
    test:assertTrue(csvb1br12 is csv:Error);
    test:assertEquals((<csv:Error>csvb1br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13_2[]|csv:Error csvb1br13_2 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br13_2, [
        {b1: "true", b2: "false", b3: "true", b4: "false", defaultableField: "", nillableField: ()},
        {b1: "true", b2: "false", b3: "true", b4: "false", defaultableField: "", nillableField: ()},
        {b1: "true", b2: "false", b3: "true", b4: "false", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb1br13 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br13, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb2br13 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br13, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb3br13 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br13, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: "()", defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb4br13 = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(csvb4br13, [
        {b1: true, b2: "()", b3: "()", b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: "()", b3: "null", b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb5br13 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br13, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb6br13 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br13, [
        {b2: "()", b3: "()", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|csv:Error csvb7br13 = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(csvb7br13, [
        {b1, b2, b3: "()", b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord14Array|csv:Error csvb7br14 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb7br14 is csv:Error);
    test:assertEquals((<csv:Error>csvb7br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType5() {
    BooleanRecord15Array|csv:Error csvb1br15 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br15 is csv:Error);
    test:assertEquals((<csv:Error>csvb1br15).message(), common:generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord15Array|csv:Error csvb6br15 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br15 is csv:Error);
    test:assertEquals((<csv:Error>csvb6br15).message(), common:generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord15Array|csv:Error csvb7br15 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertTrue(csvb7br15 is csv:Error);
    test:assertEquals((<csv:Error>csvb7br15).message(), common:generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord16Array|csv:Error csvb1br16 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br16, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord16Array|csv:Error csvb2br16 = csv:parseString(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br16, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord16Array|csv:Error csvb3br16 = csv:parseString(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord16Array|csv:Error csvb4br16 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br16, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord16Array|csv:Error csvb5br16 = csv:parseString(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord16Array|csv:Error csvb6br16 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br16, [
        {b2: (), b3: ()}
    ]);

    BooleanRecord16Array|csv:Error csvb7br16 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br16, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord17Array|csv:Error csvb1br17 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br17, [{}, {}, {}]);

    BooleanRecord17Array|csv:Error csvb4br17 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br17, [{}, {}]);

    BooleanRecord17Array|csv:Error csvb6br17 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br17, [{}]);

    BooleanRecord17Array|csv:Error csvb7br17 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br17, [{}]);

    BooleanRecord18Array|csv:Error csvb1br18 = csv:parseString(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br18, [{b2: false}, {b2: false}, {b2: false}]);

    BooleanRecord18Array|csv:Error csvb4br18 = csv:parseString(csvStringWithBooleanValues4, {});
    test:assertTrue(csvb4br18 is csv:Error);
    test:assertEquals((<csv:Error>csvb4br18).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|csv:Error csvb6br18 = csv:parseString(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br18 is csv:Error);
    test:assertEquals((<csv:Error>csvb6br18).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|csv:Error csvb7br18 = csv:parseString(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br18, [{b2, b3: ()}]);
}

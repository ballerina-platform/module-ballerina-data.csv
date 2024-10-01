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
function testFromCsvWithTypeForMapAndRecordAsExpectedType() {
    BooleanRecord1Array|csv:Error bm1br1 = csv:transform([bm1, bm1], {}, BooleanRecord1Array);
    test:assertTrue(bm1br1 is csv:Error);
    test:assertEquals((<csv:Error>bm1br1).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord1Array|csv:Error bm2br1 = csv:transform([bm2, bm2], {}, BooleanRecord1Array);
    test:assertTrue(bm2br1 is csv:Error);
    test:assertEquals((<csv:Error>bm2br1).message(), common:generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|csv:Error bm3br1 = csv:transform([bm3, bm3], {}, BooleanRecord1Array);
    test:assertEquals(bm3br1, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord1Array|csv:Error bm4br1 = csv:transform([bm4, bm4], {}, BooleanRecord1Array);
    test:assertTrue(bm4br1 is csv:Error);
    test:assertEquals((<csv:Error>bm4br1).message(), common:generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord1Array|csv:Error bm5br1 = csv:transform([bm5, bm5], {}, BooleanRecord1Array);
    test:assertEquals(bm5br1, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord2Array|csv:Error bm1br2 = csv:transform([bm1, bm1], {}, BooleanRecord2Array);
    test:assertTrue(bm1br2 is csv:Error);
    test:assertEquals((<csv:Error>bm1br2).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord2Array|csv:Error bm2br2 = csv:transform([bm2, bm2], {}, BooleanRecord2Array);
    test:assertTrue(bm2br2 is csv:Error);
    test:assertEquals((<csv:Error>bm2br2).message(), common:generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|csv:Error bm3br2 = csv:transform([bm3, bm3], {}, BooleanRecord2Array);
    test:assertEquals(bm3br2, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord2Array|csv:Error bm4br2 = csv:transform([bm4, bm4], {}, BooleanRecord2Array);
    test:assertTrue(bm4br2 is csv:Error);
    test:assertEquals((<csv:Error>bm4br2).message(), common:generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord2Array|csv:Error bm5br2 = csv:transform([bm5, bm5], {}, BooleanRecord2Array);
    test:assertEquals(bm5br2, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord3Array|csv:Error bm1br3 = csv:transform([bm1, bm1], {}, BooleanRecord3Array);
    test:assertTrue(bm1br3 is csv:Error);
    test:assertEquals((<csv:Error>bm1br3).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|csv:Error bm2br3 = csv:transform([bm2, bm2], {}, BooleanRecord3Array);
    test:assertEquals(bm2br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|csv:Error bm3br3 = csv:transform([bm3, bm3], {}, BooleanRecord3Array);
    test:assertEquals(bm3br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|csv:Error bm4br3 = csv:transform([bm4, bm4], {}, BooleanRecord3Array);
    test:assertTrue(bm4br3 is csv:Error);
    test:assertEquals((<csv:Error>bm4br3).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|csv:Error bm5br3 = csv:transform([bm5, bm5], {}, BooleanRecord3Array);
    test:assertEquals(bm5br3, [{b1: true, b3: ()}, {b1: true, b3: ()}]);

    BooleanRecord4Array|csv:Error bm1br4 = csv:transform([bm1, bm1], {}, BooleanRecord4Array);
    test:assertTrue(bm1br4 is csv:Error);
    test:assertEquals((<csv:Error>bm1br4).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|csv:Error bm2br4 = csv:transform([bm2, bm2], {}, BooleanRecord4Array);
    test:assertEquals(bm2br4, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord4Array|csv:Error bm3br4 = csv:transform([bm3, bm3], {}, BooleanRecord4Array);
    test:assertEquals(bm3br4, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord4Array|csv:Error bm4br4 = csv:transform([bm4, bm4], {}, BooleanRecord4Array);
    test:assertTrue(bm4br4 is csv:Error);
    test:assertEquals((<csv:Error>bm4br4).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|csv:Error bm5br4 = csv:transform([bm5, bm5], {}, BooleanRecord4Array);
    test:assertEquals(bm5br4, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord5Array|csv:Error bm1br5 = csv:transform([bm1, bm1], {}, BooleanRecord5Array);
    test:assertTrue(bm1br5 is csv:Error);
    test:assertEquals((<csv:Error>bm1br5).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|csv:Error bm2br5 = csv:transform([bm2, bm2], {}, BooleanRecord5Array);
    test:assertEquals(bm2br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()}
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndRecordAsExpectedType2() {
    BooleanRecord5Array|csv:Error bm3br5 = csv:transform([bm3, bm3], {}, BooleanRecord5Array);
    test:assertEquals(bm3br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false}
    ]);

    BooleanRecord5Array|csv:Error bm4br5 = csv:transform([bm4, bm4], {}, BooleanRecord5Array);
    test:assertTrue(bm4br5 is csv:Error);
    test:assertEquals((<csv:Error>bm4br5).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|csv:Error bm5br5 = csv:transform([bm5, bm5], {}, BooleanRecord5Array);
    test:assertEquals(bm5br5, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error bm1br6 = csv:transform([bm1, bm1], {}, BooleanRecord6Array);
    test:assertTrue(bm1br6 is csv:Error);
    test:assertEquals((<csv:Error>bm1br6).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|csv:Error bm2br6 = csv:transform([bm2, bm2], {}, BooleanRecord6Array);
    test:assertEquals(bm2br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error bm3br6 = csv:transform([bm3, bm3], {}, BooleanRecord6Array);
    test:assertEquals(bm3br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|csv:Error bm4br6 = csv:transform([bm4, bm4], {}, BooleanRecord6Array);
    test:assertTrue(bm4br6 is csv:Error);
    test:assertEquals((<csv:Error>bm4br6).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|csv:Error bm5br6 = csv:transform([bm5, bm5], {}, BooleanRecord6Array);
    test:assertEquals(bm5br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|csv:Error bm1br7 = csv:transform([bm1, bm1], {}, BooleanRecord7Array);
    test:assertTrue(bm1br7 is csv:Error);
    test:assertEquals((<csv:Error>bm1br7).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|csv:Error bm2br7 = csv:transform([bm2, bm2], {}, BooleanRecord7Array);
    test:assertTrue(bm2br7 is csv:Error);
    test:assertEquals((<csv:Error>bm2br7).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|csv:Error bm3br7 = csv:transform([bm3, bm3], {}, BooleanRecord7Array);
    test:assertTrue(bm3br7 is csv:Error);
    test:assertEquals((<csv:Error>bm3br7).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|csv:Error bm4br7 = csv:transform([bm4, bm4], {}, BooleanRecord7Array);
    test:assertTrue(bm4br7 is csv:Error);
    test:assertEquals((<csv:Error>bm4br7).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|csv:Error bm5br7 = csv:transform([bm5, bm5], {}, BooleanRecord7Array);
    test:assertTrue(bm5br7 is csv:Error);
    test:assertEquals((<csv:Error>bm5br7).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|csv:Error bm1br8 = csv:transform([bm1, bm1], {}, BooleanRecord8Array);
    test:assertTrue(bm1br8 is csv:Error);
    test:assertEquals((<csv:Error>bm1br8).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|csv:Error bm2br8 = csv:transform([bm2, bm2], {}, BooleanRecord8Array);
    test:assertTrue(bm2br8 is csv:Error);
    test:assertEquals((<csv:Error>bm2br8).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|csv:Error bm3br8 = csv:transform([bm3, bm3], {}, BooleanRecord8Array);
    test:assertTrue(bm3br8 is csv:Error);
    test:assertEquals((<csv:Error>bm3br8).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|csv:Error bm4br8 = csv:transform([bm4, bm4], {}, BooleanRecord8Array);
    test:assertTrue(bm4br8 is csv:Error);
    test:assertEquals((<csv:Error>bm4br8).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|csv:Error bm5br8 = csv:transform([bm5, bm5], {}, BooleanRecord8Array);
    test:assertTrue(bm5br8 is csv:Error);
    test:assertEquals((<csv:Error>bm5br8).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config
function testFromCsvWithTypeForMapAndRecordAsExpectedType3() {
    BooleanRecord9Array|csv:Error bm1br9 = csv:transform([bm1, bm1], {}, BooleanRecord9Array);
    test:assertTrue(bm1br9 is csv:Error);
    test:assertEquals((<csv:Error>bm1br9).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|csv:Error bm2br9 = csv:transform([bm2, bm2], {}, BooleanRecord9Array);
    test:assertEquals(bm2br9, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord9Array|csv:Error bm3br9 = csv:transform([bm3, bm3], {}, BooleanRecord9Array);
    test:assertEquals(bm3br9, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord9Array|csv:Error bm4br9 = csv:transform([bm4, bm4], {}, BooleanRecord9Array);
    test:assertTrue(bm4br9 is csv:Error);
    test:assertEquals((<csv:Error>bm4br9).message(), common:generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|csv:Error bm5br9 = csv:transform([bm5, bm5], {}, BooleanRecord9Array);
    test:assertEquals(bm5br9, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord10Array|csv:Error bm1br10 = csv:transform([bm1, bm1], {}, BooleanRecord10Array);
    test:assertEquals(bm1br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|csv:Error bm2br10 = csv:transform([bm2, bm2], {}, BooleanRecord10Array);
    test:assertEquals(bm2br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|csv:Error bm3br10 = csv:transform([bm3, bm3], {}, BooleanRecord10Array);
    test:assertEquals(bm3br10, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanRecord10Array|csv:Error bm4br10 = csv:transform([bm4, bm4], {}, BooleanRecord10Array);
    test:assertEquals(bm4br10, [
        {},
        {}
    ]);

    BooleanRecord10Array|csv:Error bm5br10 = csv:transform([bm5, bm5], {}, BooleanRecord10Array);
    test:assertEquals(bm5br10, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    BooleanRecord11Array|csv:Error bm1br11 = csv:transform([bm1, bm1], {}, BooleanRecord11Array);
    test:assertEquals(bm1br11, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|csv:Error bm2br11 = csv:transform([bm2, bm2], {}, BooleanRecord11Array);
    test:assertEquals(bm2br11, [
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|csv:Error bm3br11 = csv:transform([bm3, bm3], {}, BooleanRecord11Array);
    test:assertEquals(bm3br11, [
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|csv:Error bm4br11 = csv:transform([bm4, bm4], {}, BooleanRecord11Array);
    test:assertTrue(bm4br11 is csv:Error);
    test:assertEquals((<csv:Error>bm4br11).message(), common:generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|csv:Error bm5br11 = csv:transform([bm5, bm5], {}, BooleanRecord11Array);
    test:assertEquals(bm5br11, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord12Array|csv:Error bm1br12 = csv:transform([bm1, bm1], {}, BooleanRecord12Array);
    test:assertTrue(bm1br12 is csv:Error);
    test:assertEquals((<csv:Error>bm1br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|csv:Error bm2br12 = csv:transform([bm2, bm2], {}, BooleanRecord12Array);
    test:assertTrue(bm2br12 is csv:Error);
    test:assertEquals((<csv:Error>bm2br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|csv:Error bm3br12 = csv:transform([bm3, bm3], {}, BooleanRecord12Array);
    test:assertTrue(bm3br12 is csv:Error);
    test:assertEquals((<csv:Error>bm3br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|csv:Error bm4br12 = csv:transform([bm4, bm4], {}, BooleanRecord12Array);
    test:assertTrue(bm4br12 is csv:Error);
    test:assertEquals((<csv:Error>bm4br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|csv:Error bm5br12 = csv:transform([bm5, bm5], {}, BooleanRecord12Array);
    test:assertTrue(bm5br12 is csv:Error);
    test:assertEquals((<csv:Error>bm5br12).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|csv:Error bm1br13 = csv:transform([bm1, bm1], {}, BooleanRecord13Array);
    test:assertEquals(bm1br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|csv:Error bm2br13 = csv:transform([bm2, bm2], {}, BooleanRecord13Array);
    test:assertEquals(bm2br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|csv:Error bm3br13 = csv:transform([bm3, bm3], {}, BooleanRecord13Array);
    test:assertEquals(bm3br13, [
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|csv:Error bm4br13 = csv:transform([bm4, bm4], {}, BooleanRecord13Array);
    test:assertEquals(bm4br13, [
        {defaultableField: "", nillableField :null},
        {defaultableField: "", nillableField :null}
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndRecordAsExpectedType4() {
    BooleanRecord13Array|csv:Error bm5br13 = csv:transform([bm5, bm5], {}, BooleanRecord13Array);
    test:assertEquals(bm5br13, [
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord14Array|csv:Error bm1br14 = csv:transform([bm1, bm1], {}, BooleanRecord14Array);
    test:assertTrue(bm1br14 is csv:Error);
    test:assertEquals((<csv:Error>bm1br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|csv:Error bm2br14 = csv:transform([bm2, bm2], {}, BooleanRecord14Array);
    test:assertTrue(bm2br14 is csv:Error);
    test:assertEquals((<csv:Error>bm2br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|csv:Error bm3br14 = csv:transform([bm3, bm3], {}, BooleanRecord14Array);
    test:assertTrue(bm3br14 is csv:Error);
    test:assertEquals((<csv:Error>bm3br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|csv:Error bm4br14 = csv:transform([bm4, bm4], {}, BooleanRecord14Array);
    test:assertTrue(bm4br14 is csv:Error);
    test:assertEquals((<csv:Error>bm4br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|csv:Error bm5br14 = csv:transform([bm5, bm5], {}, BooleanRecord14Array);
    test:assertTrue(bm5br14 is csv:Error);
    test:assertEquals((<csv:Error>bm5br14).message(), common:generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord15Array|csv:Error bm1br15 = csv:transform([bm1, bm1], {}, BooleanRecord15Array);
    test:assertTrue(bm1br15 is csv:Error);
    test:assertEquals((<csv:Error>bm1br15).message(), common:generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|csv:Error bm3br15 = csv:transform([bm3, bm3], {}, BooleanRecord15Array);
    test:assertTrue(bm3br15 is csv:Error);
    test:assertEquals((<csv:Error>bm3br15).message(), common:generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|csv:Error bm4br15 = csv:transform([bm4, bm4], {}, BooleanRecord15Array);
    test:assertTrue(bm4br15 is csv:Error);
    test:assertEquals((<csv:Error>bm4br15).message(), common:generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord16Array|csv:Error bm1br16 = csv:transform([bm1, bm1], {}, BooleanRecord16Array);
    test:assertEquals(bm1br16, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord16Array|csv:Error bm2br16 = csv:transform([bm2, bm2], {}, BooleanRecord16Array);
    test:assertEquals(bm2br16, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord16Array|csv:Error bm3br16 = csv:transform([bm3, bm3], {}, BooleanRecord16Array);
    test:assertEquals(bm3br16, [
        {b1: true, b2: false, b4: false, b3: ()},
        {b1: true, b2: false, b4: false, b3: ()}
    ]);

    BooleanRecord16Array|csv:Error bm4br16 = csv:transform([bm4, bm4], {}, BooleanRecord16Array);
    test:assertEquals(bm4br16, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    BooleanRecord16Array|csv:Error bm5br16 = csv:transform([bm5, bm5], {}, BooleanRecord16Array);
    test:assertEquals(bm5br16, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    BooleanRecord17Array|csv:Error bm1br17 = csv:transform([bm1, bm1], {}, BooleanRecord17Array);
    test:assertEquals(bm1br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|csv:Error bm2br17 = csv:transform([bm2, bm2], {}, BooleanRecord17Array);
    test:assertEquals(bm2br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|csv:Error bm3br17 = csv:transform([bm3, bm3], {}, BooleanRecord17Array);
    test:assertEquals(bm3br17, [
        {i1: 1},
        {i1: 1}
    ]);

    BooleanRecord17Array|csv:Error bm4br17 = csv:transform([bm4, bm4], {}, BooleanRecord17Array);
    test:assertEquals(bm4br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|csv:Error bm5br17 = csv:transform([bm5, bm5], {}, BooleanRecord17Array);
    test:assertEquals(bm5br17, [
        {},
        {}
    ]);

    BooleanRecord18Array|csv:Error bm1br18 = csv:transform([bm1, bm1], {}, BooleanRecord18Array);
    test:assertEquals(bm1br18, [
        {b2: false},
        {b2: false}
    ]);

    BooleanRecord18Array|csv:Error bm2br18 = csv:transform([bm2, bm2], {}, BooleanRecord18Array);
    test:assertEquals(bm2br18, [
        {b2: false, b3: (), n1: (), n3: ()},
        {b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord18Array|csv:Error bm3br18 = csv:transform([bm3, bm3], {}, BooleanRecord18Array);
    test:assertEquals(bm3br18, [
        {b2: false, b3: (), i1: 1},
        {b2: false, b3: (), i1: 1}
    ]);

    BooleanRecord18Array|csv:Error bm4br18 = csv:transform([bm4, bm4], {}, BooleanRecord18Array);
    test:assertTrue(bm4br18 is csv:Error);
    test:assertEquals((<csv:Error>bm4br18).message(), common:generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord18Array|csv:Error bm5br18 = csv:transform([bm5, bm5], {}, BooleanRecord18Array);
    test:assertEquals(bm5br18, [
        {b2: false, b3: ()},
        {b2: false, b3: ()}
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndMapAsExpectedType() {
    BooleanMapArray|csv:Error bm1bma = csv:transform([bm1, bm1], {}, BooleanMapArray);
    test:assertEquals(bm1bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|csv:Error bm2bma = csv:transform([bm2, bm2], {}, BooleanMapArray);
    test:assertEquals(bm2bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|csv:Error bm3bma = csv:transform([bm3, bm3], {}, BooleanMapArray);
    test:assertEquals(bm3bma, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanMapArray|csv:Error bm4bma = csv:transform([bm4, bm4], {}, BooleanMapArray);
    test:assertEquals(bm4bma, [
        {},
        {}
    ]);

    BooleanMapArray|csv:Error bm5bma = csv:transform([bm5, bm5], {}, BooleanMapArray);
    test:assertEquals(bm5bma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NillableBooleanMapArray|csv:Error bm1nbma = csv:transform([bm1, bm1], {}, NillableBooleanMapArray);
    test:assertEquals(bm1nbma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableBooleanMapArray|csv:Error bm2nbma = csv:transform([bm2, bm2], {}, NillableBooleanMapArray);
    test:assertEquals(bm2nbma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|csv:Error bm3nbma = csv:transform([bm3, bm3], {}, NillableBooleanMapArray);
    test:assertEquals(bm3nbma, [
        {b1: true, b2: false, b3:(), b4: false},
        {b1: true, b2: false, b3:(), b4: false}
    ]);

    NillableBooleanMapArray|csv:Error bm4nbma = csv:transform([bm4, bm4], {}, NillableBooleanMapArray);
    test:assertEquals(bm4nbma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|csv:Error bm5nbma = csv:transform([bm5, bm5], {}, NillableBooleanMapArray);
    test:assertEquals(bm5nbma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bm1niubma = csv:transform([bm1, bm1], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm1niubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bm2niubma = csv:transform([bm2, bm2], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm2niubma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bm3niubma = csv:transform([bm3, bm3], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm3niubma, [
        {b1: true, b2: false, b3:(), b4: false, i1: 1},
        {b1: true, b2: false, b3:(), b4: false, i1: 1}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bm4niubma = csv:transform([bm4, bm4], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm4niubma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bm5niubma = csv:transform([bm5, bm5], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm5niubma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    IntUnionBooleanMapArray|csv:Error bm1iubma = csv:transform([bm1, bm1], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm1iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|csv:Error bm2iubma = csv:transform([bm2, bm2], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm2iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|csv:Error bm3iubma = csv:transform([bm3, bm3], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm3iubma, [
        {b1: true, b2: false, b4: false, i1: 1},
        {b1: true, b2: false, b4: false, i1: 1}
    ]);

    IntUnionBooleanMapArray|csv:Error bm4iubma = csv:transform([bm4, bm4], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm4iubma, [
        {},
        {}
    ]);

    IntUnionBooleanMapArray|csv:Error bm5iubma = csv:transform([bm5, bm5], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm5iubma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NilMapArray|csv:Error bm1nma = csv:transform([bm1, bm1], {}, NilMapArray);
    test:assertEquals(bm1nma, [
        {},
        {}
    ]);

    NilMapArray|csv:Error bm2nma = csv:transform([bm2, bm2], {}, NilMapArray);
    test:assertEquals(bm2nma, [
        {n1: (), n3: (), b3: ()},
        {n1: (), n3: (), b3: ()}
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndMapAsExpectedType2() {
    NilMapArray|csv:Error bm3nma = csv:transform([bm3, bm3], {}, NilMapArray);
    test:assertEquals(bm3nma, [
        {b3: ()},
        {b3: ()}
    ]);

    NilMapArray|csv:Error bm4nma = csv:transform([bm4, bm4], {}, NilMapArray);
    test:assertEquals(bm4nma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);
    NilMapArray|csv:Error bm5nma = csv:transform([bm5, bm5], {}, NilMapArray);
    test:assertEquals(bm5nma, [
        {b3: ()},
        {b3: ()}
    ]);

    JsonMapArray|csv:Error bm1jma = csv:transform([bm1, bm1], {}, JsonMapArray);
    test:assertEquals(bm1jma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    JsonMapArray|csv:Error bm2jma = csv:transform([bm2, bm2], {}, JsonMapArray);
    test:assertEquals(bm2jma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    JsonMapArray|csv:Error bm3jma = csv:transform([bm3, bm3], {}, JsonMapArray);
    test:assertEquals(bm3jma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    JsonMapArray|csv:Error bm4jma = csv:transform([bm4, bm4], {}, JsonMapArray);
    test:assertEquals(bm4jma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    JsonMapArray|csv:Error bm5jma = csv:transform([bm5, bm5], {}, JsonMapArray);
    test:assertEquals(bm5jma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    AnydataMapArray|csv:Error bm1anydma = csv:transform([bm1, bm1], {}, AnydataMapArray);
    test:assertEquals(bm1anydma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    AnydataMapArray|csv:Error bm2anydma = csv:transform([bm2, bm2], {}, AnydataMapArray);
    test:assertEquals(bm2anydma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    AnydataMapArray|csv:Error bm3anydma = csv:transform([bm3, bm3], {}, AnydataMapArray);
    test:assertEquals(bm3anydma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    AnydataMapArray|csv:Error bm4anydma = csv:transform([bm4, bm4], {}, AnydataMapArray);
    test:assertEquals(bm4anydma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    AnydataMapArray|csv:Error bm5anydma = csv:transform([bm5, bm5], {}, AnydataMapArray);
    test:assertEquals(bm5anydma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    CustomMapArray|csv:Error bm1cma = csv:transform([bm1, bm1], {}, CustomMapArray);
    test:assertEquals(bm1cma, [
        {},
        {}
    ]);

    CustomMapArray|csv:Error bm2cma = csv:transform([bm2, bm2], {}, CustomMapArray);
    test:assertEquals(bm2cma, [
        {},
        {}
    ]);

    CustomMapArray|csv:Error bm3cma = csv:transform([bm3, bm3], {}, CustomMapArray);
    test:assertEquals(bm3cma, [
        {i1: 1},
        {i1: 1}
    ]);

    CustomMapArray|csv:Error bm4cma = csv:transform([bm4, bm4], {}, CustomMapArray);
    test:assertEquals(bm4cma, [
        {},
        {}
    ]);

    CustomMapArray|csv:Error bm5cma = csv:transform([bm5, bm5], {}, CustomMapArray);
    test:assertEquals(bm5cma, [
        {},
        {}
    ]);

    StringMapArray|csv:Error bm1sma = csv:transform([bm1, bm1], {}, StringMapArray);
    test:assertEquals(bm1sma, [
        {},
        {}
    ]);

    StringMapArray|csv:Error bm2sma = csv:transform([bm2, bm2], {}, StringMapArray);
    test:assertEquals(bm2sma, [
        {},
        {}
    ]);

    StringMapArray|csv:Error bm3sma = csv:transform([bm3, bm3], {}, StringMapArray);
    test:assertEquals(bm3sma, [
        {},
        {}
    ]);

    StringMapArray|csv:Error bm4sma = csv:transform([bm4, bm4], {}, StringMapArray);
    test:assertEquals(bm4sma, [
        {},
        {}
    ]);

    StringMapArray|csv:Error bm5sma = csv:transform([bm5, bm5], {}, StringMapArray);
    test:assertEquals(bm5sma, [
        {},
        {}
    ]);
}

@test:Config
function testArrayIndexesInRecords() {
    map<int>[] csv = [{a: 1, b: 2}, {a: 3, b: 4}, {a: 5, b: 6}, {a: 7, b: 8}];

    record {}[2]|csv:Error rec = csv:transform(csv);
    test:assertEquals(rec, [
                {a: 1, b: 2},
                {a: 3, b: 4}
            ]);

    record {|int a;|}[2]|csv:Error rec2 = csv:transform(csv, {skipLines: [2]});
    test:assertEquals(rec2, [
                {a: 1},
                {a: 5}
            ]);

    record {|int a;|}[5]|csv:Error rec2_2 = csv:transform(csv, {skipLines: [2]});
    test:assertTrue(rec2_2 is csv:Error);
}
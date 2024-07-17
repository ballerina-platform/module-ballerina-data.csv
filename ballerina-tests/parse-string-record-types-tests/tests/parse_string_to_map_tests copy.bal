import ballerina/data.csv as csv;
import ballerina/test;

@test:Config
function testFromCsvStringWithTypeForStringAndMapAsExpectedType() {
    BooleanMapArray|csv:Error bv1bma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanMapArray|csv:Error bv2bma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanMapArray|csv:Error bv3bma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanMapArray|csv:Error bv4bma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanMapArray|csv:Error bv5bma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanMapArray|csv:Error bv6bma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bma, [
        {}
    ]);

    BooleanMapArray|csv:Error bv7bma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bma, [
        {b1, b2, b4}
    ]);

    NillableBooleanMapArray|csv:Error bv1bnbma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnbma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableBooleanMapArray|csv:Error bv2bnbma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnbma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableBooleanMapArray|csv:Error bv3bnbma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableBooleanMapArray|csv:Error bv4bnbma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnbma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableBooleanMapArray|csv:Error bv5bnbma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    NillableBooleanMapArray|csv:Error bv6bnbma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnbma, [
        {b2: (), b3: ()}
    ]);

    NillableBooleanMapArray|csv:Error bv7bnbma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnbma, [
        {b1, b2, b3, b4}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv1bniubma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bniubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv2bniubma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bniubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

}

@test:Config
function testFromCsvStringWithTypeForStringAndMapAsExpectedType2() {
    NillableIntUnionBooleanMapArray|csv:Error bv3bniubma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bniubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv4bniubma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bniubma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv5bniubma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bniubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv6bniubma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bniubma, [
        {b2: (), b3: ()}
    ]);

    NillableIntUnionBooleanMapArray|csv:Error bv7bniubma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bniubma, [
        {b1, b2, b3, b4}
    ]);

    IntUnionBooleanMapArray|csv:Error bv1biubma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1biubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    IntUnionBooleanMapArray|csv:Error bv2biubma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2biubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    IntUnionBooleanMapArray|csv:Error bv3biubma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3biubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    IntUnionBooleanMapArray|csv:Error bv4biubma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4biubma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    IntUnionBooleanMapArray|csv:Error bv5biubma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5biubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    IntUnionBooleanMapArray|csv:Error bv6biubma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6biubma, [
        {}
    ]);

    IntUnionBooleanMapArray|csv:Error bv7biubma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7biubma, [
        {b1, b2, b4}
    ]);

    NilMapArray|csv:Error bv1bnma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnma, [
        {},
        {},
        {}
    ]);

    NilMapArray|csv:Error bv2bnma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnma, [
        {},
        {}
    ]);

    NilMapArray|csv:Error bv3bnma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnma, [
        {},
        {b3: ()},
        {}
    ]);

    NilMapArray|csv:Error bv4bnma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnma, [
        {b2: (), b3: ()},
        {b2: (), b3: ()}
    ]);

    NilMapArray|csv:Error bv5bnma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnma, [
        {},
        {}
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndMapAsExpectedType3() {
    NilMapArray|csv:Error bv6bnma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnma, [
        {b2: (), b3: ()}
    ]);

    NilMapArray|csv:Error bv7bnma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnma, [
        {b3}
    ]);

    JsonMapArray|csv:Error bv1bjma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bjma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    JsonMapArray|csv:Error bv2bjma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bjma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    JsonMapArray|csv:Error bv3bjma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bjma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    JsonMapArray|csv:Error bv4bjma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bjma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    JsonMapArray|csv:Error bv5bjma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bjma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    JsonMapArray|csv:Error bv6bjma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bjma, [
        {b2: (), b3: ()}
    ]);

    JsonMapArray|csv:Error bv7bjma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bjma, [
        {b1, b2, b3, b4}
    ]);

    AnydataMapArray|csv:Error bv1banydma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1banydma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    AnydataMapArray|csv:Error bv2banydma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2banydma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    AnydataMapArray|csv:Error bv3banydma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3banydma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    AnydataMapArray|csv:Error bv4banydma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4banydma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    AnydataMapArray|csv:Error bv5banydma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5banydma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    AnydataMapArray|csv:Error bv6banydma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6banydma, [
        {b2: (), b3: ()}
    ]);

    AnydataMapArray|csv:Error bv7banydma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7banydma, [
        {b1, b2, b3, b4}
    ]);

    CustomMapArray|csv:Error bv1bcma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndMapAsExpectedType4() {
    CustomMapArray|csv:Error bv2bcma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    CustomMapArray|csv:Error bv3bcma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bcma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    CustomMapArray|csv:Error bv4bcma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bcma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    CustomMapArray|csv:Error bv5bcma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bcma, [
        {b1: "true", b2: "false", b3: "true", b4: 2},
        {b1: "true", b2: "false", b3: "true", b4: 3}
    ]);

    CustomMapArray|csv:Error bv6bcma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bcma, [
        {b2: "()", b3: "()"}
    ]);

    CustomMapArray|csv:Error bv7bcma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bcma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    StringMapArray|csv:Error bv1bsma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    StringMapArray|csv:Error bv2bsma = csv:parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    StringMapArray|csv:Error bv3bsma = csv:parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bsma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    StringMapArray|csv:Error bv4bsma = csv:parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bsma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    StringMapArray|csv:Error bv5bsma = csv:parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "2"},
        {b1: "true", b2: "false", b3: "true", b4: "3"}
    ]);

    StringMapArray|csv:Error bv6bsma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bsma, [
        {b2: "()", b3: "()"}
    ]);

    StringMapArray|csv:Error bv7bsma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bsma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    DecimalMapArray|csv:Error bv1dsma = csv:parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1dsma, [
        {},
        {},
        {}
    ]);
    DecimalMapArray|csv:Error bv6dsma = csv:parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6dsma, [
        {}
    ]);

    DecimalMapArray|csv:Error bv7dsma = csv:parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7dsma, [
        {}
    ]);
}

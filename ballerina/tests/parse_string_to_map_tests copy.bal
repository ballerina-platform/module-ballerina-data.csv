import ballerina/test;

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndMapAsExpectedType() {
    BooleanMapArray|Error bv1bma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanMapArray|Error bv2bma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanMapArray|Error bv3bma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanMapArray|Error bv4bma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanMapArray|Error bv5bma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanMapArray|Error bv6bma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bma, [
        {}
    ]);

    BooleanMapArray|Error bv7bma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bma, [
        {b1, b2, b4}
    ]);

    NillableBooleanMapArray|Error bv1bnbma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnbma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableBooleanMapArray|Error bv2bnbma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnbma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableBooleanMapArray|Error bv3bnbma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableBooleanMapArray|Error bv4bnbma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnbma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableBooleanMapArray|Error bv5bnbma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    NillableBooleanMapArray|Error bv6bnbma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnbma, [
        {b2: (), b3: ()}
    ]);

    NillableBooleanMapArray|Error bv7bnbma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnbma, [
        {b1, b2, b3, b4}
    ]);

    NillableIntUnionBooleanMapArray|Error bv1bniubma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bniubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableIntUnionBooleanMapArray|Error bv2bniubma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bniubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableIntUnionBooleanMapArray|Error bv3bniubma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bniubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableIntUnionBooleanMapArray|Error bv4bniubma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bniubma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableIntUnionBooleanMapArray|Error bv5bniubma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bniubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    NillableIntUnionBooleanMapArray|Error bv6bniubma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bniubma, [
        {b2: (), b3: ()}
    ]);

    NillableIntUnionBooleanMapArray|Error bv7bniubma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bniubma, [
        {b1, b2, b3, b4}
    ]);

    IntUnionBooleanMapArray|Error bv1biubma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1biubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    IntUnionBooleanMapArray|Error bv2biubma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2biubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    IntUnionBooleanMapArray|Error bv3biubma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3biubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    IntUnionBooleanMapArray|Error bv4biubma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4biubma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    IntUnionBooleanMapArray|Error bv5biubma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5biubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    IntUnionBooleanMapArray|Error bv6biubma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6biubma, [
        {}
    ]);

    IntUnionBooleanMapArray|Error bv7biubma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7biubma, [
        {b1, b2, b4}
    ]);

    NilMapArray|Error bv1bnma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnma, [
        {},
        {},
        {}
    ]);

    NilMapArray|Error bv2bnma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnma, [
        {},
        {}
    ]);

    NilMapArray|Error bv3bnma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnma, [
        {},
        {b3: ()},
        {}
    ]);

    NilMapArray|Error bv4bnma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnma, [
        {b2: (), b3: ()},
        {b2: (), b3: ()}
    ]);

    NilMapArray|Error bv5bnma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnma, [
        {},
        {}
    ]);

    NilMapArray|Error bv6bnma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnma, [
        {b2: (), b3: ()}
    ]);

    NilMapArray|Error bv7bnma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnma, [
        {b3}
    ]);

    JsonMapArray|Error bv1bjma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bjma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    JsonMapArray|Error bv2bjma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bjma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    JsonMapArray|Error bv3bjma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bjma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    JsonMapArray|Error bv4bjma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bjma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    JsonMapArray|Error bv5bjma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bjma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    JsonMapArray|Error bv6bjma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bjma, [
        {b2: (), b3: ()}
    ]);

    JsonMapArray|Error bv7bjma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bjma, [
        {b1, b2, b3, b4}
    ]);

    AnydataMapArray|Error bv1banydma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1banydma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    AnydataMapArray|Error bv2banydma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2banydma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    AnydataMapArray|Error bv3banydma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3banydma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    AnydataMapArray|Error bv4banydma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4banydma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    AnydataMapArray|Error bv5banydma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5banydma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    AnydataMapArray|Error bv6banydma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6banydma, [
        {b2: (), b3: ()}
    ]);

    AnydataMapArray|Error bv7banydma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7banydma, [
        {b1, b2, b3, b4}
    ]);

    CustomMapArray|Error bv1bcma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    CustomMapArray|Error bv2bcma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    CustomMapArray|Error bv3bcma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bcma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    CustomMapArray|Error bv4bcma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bcma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    CustomMapArray|Error bv5bcma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bcma, [
        {b1: "true", b2: "false", b3: "true", b4: 2},
        {b1: "true", b2: "false", b3: "true", b4: 3}
    ]);

    CustomMapArray|Error bv6bcma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bcma, [
        {b2: "()", b3: "()"}
    ]);

    CustomMapArray|Error bv7bcma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bcma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    StringMapArray|Error bv1bsma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    StringMapArray|Error bv2bsma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    StringMapArray|Error bv3bsma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bsma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    StringMapArray|Error bv4bsma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bsma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    StringMapArray|Error bv5bsma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "2"},
        {b1: "true", b2: "false", b3: "true", b4: "3"}
    ]);

    StringMapArray|Error bv6bsma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bsma, [
        {b2: "()", b3: "()"}
    ]);

    StringMapArray|Error bv7bsma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bsma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    DecimalMapArray|Error bv1dsma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1dsma, [
        {},
        {},
        {}
    ]);
    DecimalMapArray|Error bv6dsma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6dsma, [
        {}
    ]);

    DecimalMapArray|Error bv7dsma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7dsma, [
        {}
    ]);
}

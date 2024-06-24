import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//     NillableIntUnionBooleanMapArray|CsvConversionError bv4bniubma = parseStringToRecord(string `a
//     0`);
//     test:assertEquals(bv4bniubma, [
//         {b1: true, b2: (), b3: (), b4: 0},
//         {b1: 1, b2: (), b3: (), b4: false}
//     ]);
// }

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndMapAsExpectedType() {
    BooleanMapArray|CsvConversionError bv1bma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bv2bma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanMapArray|CsvConversionError bv3bma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanMapArray|CsvConversionError bv4bma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bv5bma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanMapArray|CsvConversionError bv6bma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bma, [
        {}
    ]);

    BooleanMapArray|CsvConversionError bv7bma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bma, [
        {b1, b2, b4}
    ]);

    NillableBooleanMapArray|CsvConversionError bv1bnbma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnbma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv2bnbma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnbma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bv3bnbma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv4bnbma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnbma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv5bnbma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bv6bnbma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnbma, [
        {b2: (), b3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bv7bnbma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnbma, [
        {b1, b2, b3, b4}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv1bniubma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bniubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv2bniubma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bniubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv3bniubma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bniubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv4bniubma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bniubma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv5bniubma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bniubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv6bniubma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bniubma, [
        {b2: (), b3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv7bniubma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bniubma, [
        {b1, b2, b3, b4}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv1biubma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1biubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv2biubma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2biubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv3biubma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3biubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv4biubma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4biubma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv5biubma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5biubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv6biubma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6biubma, [
        {}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv7biubma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7biubma, [
        {b1, b2, b4}
    ]);

    NilMapArray|CsvConversionError bv1bnma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnma, [
        {},
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv2bnma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv3bnma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnma, [
        {},
        {b3: ()},
        {}
    ]);

    NilMapArray|CsvConversionError bv4bnma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnma, [
        {b2: (), b3: ()},
        {b2: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bv5bnma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv6bnma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnma, [
        {b2: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bv7bnma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnma, [
        {b3}
    ]);

    JsonMapArray|CsvConversionError bv1bjma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bjma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    JsonMapArray|CsvConversionError bv2bjma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bjma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    JsonMapArray|CsvConversionError bv3bjma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bjma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    JsonMapArray|CsvConversionError bv4bjma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bjma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    JsonMapArray|CsvConversionError bv5bjma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bjma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    JsonMapArray|CsvConversionError bv6bjma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bjma, [
        {b2: (), b3: ()}
    ]);

    JsonMapArray|CsvConversionError bv7bjma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bjma, [
        {b1, b2, b3, b4}
    ]);

    AnydataMapArray|CsvConversionError bv1banydma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1banydma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    AnydataMapArray|CsvConversionError bv2banydma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2banydma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    AnydataMapArray|CsvConversionError bv3banydma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3banydma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    AnydataMapArray|CsvConversionError bv4banydma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4banydma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    AnydataMapArray|CsvConversionError bv5banydma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5banydma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    AnydataMapArray|CsvConversionError bv6banydma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6banydma, [
        {b2: (), b3: ()}
    ]);

    AnydataMapArray|CsvConversionError bv7banydma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7banydma, [
        {b1, b2, b3, b4}
    ]);

    CustomMapArray|CsvConversionError bv1bcma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    CustomMapArray|CsvConversionError bv2bcma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    CustomMapArray|CsvConversionError bv3bcma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bcma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    CustomMapArray|CsvConversionError bv4bcma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bcma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    CustomMapArray|CsvConversionError bv5bcma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bcma, [
        {b1: "true", b2: "false", b3: "true", b4: 2},
        {b1: "true", b2: "false", b3: "true", b4: 3}
    ]);

    CustomMapArray|CsvConversionError bv6bcma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bcma, [
        {b2: "()", b3: "()"}
    ]);

    CustomMapArray|CsvConversionError bv7bcma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bcma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv1bsma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv2bsma = parseStringToRecord(csvStringWithBooleanValues2);
    test:assertEquals(bv2bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    StringMapArray|CsvConversionError bv3bsma = parseStringToRecord(csvStringWithBooleanValues3);
    test:assertEquals(bv3bsma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    StringMapArray|CsvConversionError bv4bsma = parseStringToRecord(csvStringWithBooleanValues4);
    test:assertEquals(bv4bsma, [
        {b1: "true", b2: "()", b3: "()", b4: "false"},
        {b1: "true", b2: "()", b3: "null", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv5bsma = parseStringToRecord(csvStringWithBooleanValues5);
    test:assertEquals(bv5bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "2"},
        {b1: "true", b2: "false", b3: "true", b4: "3"}
    ]);

    StringMapArray|CsvConversionError bv6bsma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6bsma, [
        {b2: "()", b3: "()"}
    ]);

    StringMapArray|CsvConversionError bv7bsma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7bsma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    DecimalMapArray|CsvConversionError bv1dsma = parseStringToRecord(csvStringWithBooleanValues1);
    test:assertEquals(bv1dsma, [
        {},
        {},
        {}
    ]);
    DecimalMapArray|CsvConversionError bv6dsma = parseStringToRecord(csvStringWithBooleanValues6);
    test:assertEquals(bv6dsma, [
        {}
    ]);

    DecimalMapArray|CsvConversionError bv7dsma = parseStringToRecord(csvStringWithBooleanValues7);
    test:assertEquals(bv7dsma, [
        {}
    ]);

    //TODO: Fix the test case
    // string csvValue1 = string `a,
    //                             1,,`;
    // record{}[]|error a = parseStringToRecord(csvValue1, {});
    // test:assertEquals(a, [{a: 1}]);
}

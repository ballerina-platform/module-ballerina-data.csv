import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//     BooleanRecord1Array|CsvConversionError csvb4br1 = parseStringToRecord(csvStringWithBooleanValues4, {});
//     test:assertEquals(csvb4br1, [
//         {b1: true, b2: "()", b3: (), b4: false},
//         {b1: true, b2: "()", b3: (), b4: false}
//     ]);
// }

@test:Config {enable}
function testFromCsvWithTypeFunctionWithTypeCompatibility() {
    var value = {i1, i2, s1, s2, b1, b2, n1, n2, f1, f2, d1, d2, j1: b1, a1: d1, j2: b2, a2: d2};
    var value2 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3, j2: b2, a2: d2};
    var value3 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3};

    CustomRecord27Array|CsvConversionError vcr27a = parseRecordAsRecordType([value, value, value], {}, CustomRecord27Array);
    test:assertEquals(vcr27a , [
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()}
    ]);

    // TODO: 
    // CustomTuple7Array|CsvConversionError v2ct7a = parseRecordAsListType([value2, value2, value2], {}, CustomTuple7Array);
    // test:assertTrue(v2ct7a is CsvConversionError);
    // test:assertEquals((<CsvConversionError>v2ct7a).message(), generateErrorMessageForInvalidValueForArrayType("false", "10", "string"));

    // CustomTuple7Array|CsvConversionError v3ct7a = parseRecordAsListType([value3, value3, value3], {}, CustomTuple7Array);
    // test:assertEquals(v3ct7a , [
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3]
    // ]);

    // AnydataArray1Array|CsvConversionError v3anyd1a = parseRecordAsListType([value3, value3, value3], {}, AnydataArray1Array);
    // test:assertEquals(v3anyd1a , [
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
    //     [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3]
    // ]);

    AnydataMapArray|CsvConversionError vanydma = parseRecordAsRecordType([value, value, value], {}, AnydataMapArray);
    test:assertEquals(vanydma , [
        value,
        value,
        value
    ]);

    JsonMapArray|CsvConversionError vjma = parseRecordAsRecordType([value, value, value], {}, JsonMapArray);
    test:assertEquals(vjma , [
        value,
        value,
        value
    ]);

    record{|int...;|}[]|CsvConversionError irrma = parseRecordAsRecordType([{"a": 1}, {"a": i1, "b": i2}, {"a": i1, "b": i2, "c": s1}]);
    test:assertEquals(irrma , [
        {a:1},
        {a: i1, b: i2},
        {a: i1, b: i2}
    ]);

    record{|decimal...;|}[]|CsvConversionError drra = parseRecordAsRecordType([{"a": d1}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1, "d": f3}]);
    test:assertTrue(drra is record{|decimal...;|}[]);
    test:assertEquals(drra , [
        {a: d1},
        {a: d2, b: d3},
        {a: d4, b: -3.21d, d: <decimal>f3}
    ]);

    record{|string...;|}[]|CsvConversionError srra = parseRecordAsRecordType([{"a": "string"}, {"c": 1, "a": s1, "b": s2}, {"a": b1, "b": s3, "c": d1}]);
    test:assertEquals(srra , [
        {a: "string"},
        {a: s1, b: s2},
        {b: s3}
    ]);

    record{|float...;|}[]|CsvConversionError frra = parseRecordAsRecordType([{"a": 1.2, "b": 1.2f}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1}]);
    test:assertEquals(frra , [
        {a: 1.2, b: 1.2},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2}
    ]);

    record{|float a; decimal b;|}[]|CsvConversionError fdc1a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc1a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|float a; decimal ...;|}[]|CsvConversionError fdc2a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc2a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|decimal b; float...;|}[]|CsvConversionError fdc3a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc3a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);
}

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
function testFromCsvStringWithTypeCompatibility() {
    string value = string `
        i1,i2,s1,s2,  b1,b2,n1,n2,f1,f2, d1,d2,j1,a1,j2,a2
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),${f1}, ${f2},${d1},${d2},${b1},${d1},${b2},${d2}
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),  ${f1},${f2},${d1},${d2},${b1},${d1},${b2},${d2}
    `;
    string value2 = string `
        i1, s1, b1, n1, f1, d1, j1, a1, s2, s3, j2, a2
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3},${b2}, ${d2}
    `;
    string value3 = string `
        i1, s1, b1, n1, f1, d1, j1, a1, s2, s3
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3}
    `;

    AnydataArray1Array|CsvConversionError v3anyd1a = parseStringToList(value);
    test:assertEquals(v3anyd1a, [
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21],
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21]
    ]);

    CustomRecord27Array|CsvConversionError vcr27a = parseStringToRecord(value, {}, CustomRecord27Array);
    test:assertEquals(vcr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomRecord27Array|CsvConversionError v2cr27a = parseStringToRecord(value2, {}, CustomRecord27Array);
    test:assertEquals(v2cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, j2: "false", a2: "-3.21", s3}
    ]);

    CustomRecord27Array|CsvConversionError v3cr27a = parseStringToRecord(value3, {});
    test:assertEquals(v3cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, s3}
    ]);

    AnydataMapArray|CsvConversionError vanydma = parseStringToRecord(value);
    test:assertEquals(vanydma, [
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    JsonMapArray|CsvConversionError vjma = parseStringToRecord(value);
    test:assertEquals(vjma, <JsonMapArray>[
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    StringMapArray|CsvConversionError vsma = parseStringToRecord(value);
    test:assertEquals(vsma, <JsonMapArray>[
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomTuple7Array|CsvConversionError v2ct7a = parseStringToList(value2);
    test:assertEquals(v2ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3, "false", "-3.21"]
    ]);

    CustomTuple7Array|CsvConversionError v3ct7a = parseStringToList(value3);
    test:assertEquals(v3ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3]
    ]);

    // CustomTuple8Array|CsvConversionError v2ct8a = fromCsvStringWithType(value2);
    // test:assertTrue(v2ct8a is CsvConversionError);
    // test:assertEquals((<CsvConversionError>v2ct8a).message(), generateErrorMessageForInvalidValueForArrayType("false", "10", "int"));

    [float, decimal, string][]|CsvConversionError mrrta = parseStringToList(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrrta, [
        [<float>1.23, <decimal>1.23, "1.23"],
        [<float>0, <decimal>0, "0"],
        [<float>0, <decimal>0, "0.0"],
        [<float>-1.2, <decimal>-1.2, "-1.2"]
    ]);

    [float, decimal, string, int][]|CsvConversionError m2rrta = parseStringToList(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rrta, [
        [<float>1, <decimal>1, "1", 1],
        [<float>0, <decimal>0, "0", 0],
        [<float>-1, <decimal>-1, "-1", -1]
    ]);

    [int...][]|CsvConversionError m3rrta = parseStringToList(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rrta is CsvConversionError);
    test:assertEquals((<CsvConversionError>m3rrta).message(), generateErrorMessageForInvalidCast("1.2", "int"));

    [boolean, int][]|CsvConversionError m4rrta = parseStringToList(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rrta, [
        [true, 1],
        [false, 0]
    ]);

    record {|int...;|}[]|CsvConversionError irrma = parseStringToRecord(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertEquals(irrma, [
        {a: 1},
        {a: i1, b: i2},
        {b: i2}
    ]);

    record {|()...;|}[]|CsvConversionError nrrma = parseStringToRecord(string `
                                                                            a, b, c
                                                                            1, a, ()
                                                                            1, null, ()
                                                                            hello, -2, hello`);
    test:assertEquals(nrrma, [
        {c: ()},
        {b: (), c: ()},
        {}
    ]);

    record {|decimal...;|}[]|CsvConversionError drra = parseStringToRecord(string `a, b,     c
                                                                            2.234, invalid , 1
                                                                            ${f2}, 0, 2.3d
                                                                            invalid, ${d2}, ${f3}`);
    test:assertTrue(drra is record {|decimal...;|}[]);
    test:assertEquals(drra, [
        {a: d1, c: <decimal>1.0},
        {a: <decimal>f2, b: d3},
        {b: -3.21d, c: <decimal>f3}
    ]);

    record {|string...;|}[]|CsvConversionError srra = parseStringToRecord(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertTrue(srra is record {|string...;|}[]);
    test:assertEquals(srra, [
        {a: "1", b: "a", c: "2.3"},
        {a: "1", b: "-2", c: "true"},
        {a: "hello", b: "-2", c: "hello"}
    ]);

    record {|float...;|}[]|CsvConversionError frra = parseStringToRecord(string `a, b,     c
                                                                            1.2, invalid , 1
                                                                            ${d2}, ${d3}, true
                                                                            ${d4}, ${f2}, 0.0`);
    test:assertEquals(frra, [
        {a: 1.2, c: 1.0},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2, c: 0.0}
    ]);

    record {float a; decimal b; string c;}[]|CsvConversionError mrra = parseStringToRecord(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrra, [
        {a: <float>1.23, b: <decimal>1.23, c: "1.23"},
        {a: <float>0, b: <decimal>0, c: "0"},
        {a: <float>0, b: <decimal>0, c: "0.0"},
        {a: <float>-1.2, b: <decimal>-1.2, c: "-1.2"}
    ]);

    record {|float a; decimal b; string c; int d;|}[]|CsvConversionError m2rra = parseStringToRecord(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rra, [
        {a: <float>1, b: <decimal>1, c: "1", d: 1},
        {a: <float>0, b: <decimal>0, c: "0", d: 0},
        {a: <float>-1, b: <decimal>-1, c: "-1", d: -1}
    ]);

    record {int d;}[]|CsvConversionError m3rra = parseStringToRecord(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rra is CsvConversionError);
    test:assertEquals((<CsvConversionError>m3rra).message(), generateErrorMessageForInvalidCast("1.0", "int"));

    record {int b; boolean a;}[]|CsvConversionError m4rra = parseStringToRecord(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rra, [
        {a: true, b: 1},
        {a: false, b: 0}
    ]);
}
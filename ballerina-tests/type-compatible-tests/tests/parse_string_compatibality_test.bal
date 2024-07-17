import ballerina/csv_commons as common;
import ballerina/data.csv as csv;
import ballerina/io;
import ballerina/test;

const string filepath = "tests/csv_content.txt";

@test:Config
function testFromCsvStringWithTypeCompatibility() {
    string value = string `i1,i2,s1,s2,  b1,b2,n1,n2,f1,f2, d1,d2,j1,a1,j2,a2
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),${f1}, ${f2},${d1},${d2},${b1},${d1},${b2},${d2}
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),  ${f1},${f2},${d1},${d2},${b1},${d1},${b2},${d2}
    `;
    string value2 = string `i1, s1, b1, n1, f1, d1, j1, a1, s2, s3, j2, a2
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3},${b2}, ${d2}
    `;
    string value3 = string `i1, s1, b1, n1, f1, d1, j1, a1, s2, s3
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3}
    `;

    AnydataArray1Array|csv:Error v3anyd1a = csv:parseStringToList(value);
    test:assertEquals(v3anyd1a, [
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21],
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21]
    ]);

    CustomRecord27Array|csv:Error vcr27a = csv:parseStringToRecord(value, {}, CustomRecord27Array);
    test:assertEquals(vcr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomRecord27Array|csv:Error v2cr27a = csv:parseStringToRecord(value2, {}, CustomRecord27Array);
    test:assertEquals(v2cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, j2: "false", a2: "-3.21", s3}
    ]);

    CustomRecord27Array|csv:Error v3cr27a = csv:parseStringToRecord(value3, {});
    test:assertEquals(v3cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, s3}
    ]);

    AnydataMapArray|csv:Error vanydma = csv:parseStringToRecord(value);
    test:assertEquals(vanydma, [
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    JsonMapArray|csv:Error vjma = csv:parseStringToRecord(value);
    test:assertEquals(vjma, <JsonMapArray>[
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    StringMapArray|csv:Error vsma = csv:parseStringToRecord(value);
    test:assertEquals(vsma, <JsonMapArray>[
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomTuple7Array|csv:Error v2ct7a = csv:parseStringToList(value2);
    test:assertEquals(v2ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3, "false", "-3.21"]
    ]);

    CustomTuple7Array|csv:Error v3ct7a = csv:parseStringToList(value3);
    test:assertEquals(v3ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3]
    ]);

    [float, decimal, string][]|csv:Error mrrta = csv:parseStringToList(string `a, b,c
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

    [float, decimal, string, int][]|csv:Error m2rrta = csv:parseStringToList(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rrta, [
        [<float>1, <decimal>1, "1", 1],
        [<float>0, <decimal>0, "0", 0],
        [<float>-1, <decimal>-1, "-1", -1]
    ]);

    [int...][]|csv:Error m3rrta = csv:parseStringToList(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rrta is csv:Error);
    test:assertEquals((<csv:Error>m3rrta).message(), common:generateErrorMessageForInvalidCast("1.2", "int"));

    [boolean|int, int|boolean][]|csv:Error m4rrta = csv:parseStringToList(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rrta, [
        [1, 1],
        [0, 0]
    ]);

    record {|int...;|}[]|csv:Error irrma = csv:parseStringToRecord(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`, {header: 1});
    test:assertEquals(irrma, [
        {a: 1},
        {a: i1, b: i2},
        {b: i2}
    ]);

    record {|()...;|}[]|csv:Error nrrma = csv:parseStringToRecord(string `
                                                                            a, b, c
                                                                            1, a, ()
                                                                            1, null, ()
                                                                            hello, -2, hello`, {header: 1});
    test:assertEquals(nrrma, [
        {c: ()},
        {b: (), c: ()},
        {}
    ]);

    record {|decimal...;|}[]|csv:Error drra = csv:parseStringToRecord(string `a, b,     c
                                                                            2.234, invalid , 1
                                                                            ${f2}, 0, 2.3d
                                                                            invalid, ${d2}, ${f3}`);
    test:assertTrue(drra is record {|decimal...;|}[]);
    test:assertEquals(drra, [
        {a: d1, c: <decimal>1.0},
        {a: <decimal>f2, b: d3},
        {b: -3.21d, c: <decimal>f3}
    ]);

    record {|string...;|}[]|csv:Error srra = csv:parseStringToRecord(string `a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertTrue(srra is record {|string...;|}[]);
    test:assertEquals(srra, [
        {a: "1", b: "a", c: "2.3"},
        {a: "1", b: "-2", c: "true"},
        {a: "hello", b: "-2", c: "hello"}
    ]);

    record {|float...;|}[]|csv:Error frra = csv:parseStringToRecord(string `a, b,     c
                                                                            1.2, invalid , 1
                                                                            ${d2}, ${d3}, true
                                                                            ${d4}, ${f2}, 0.0`);
    test:assertEquals(frra, [
        {a: 1.2, c: 1.0},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2, c: 0.0}
    ]);

    record {float a; decimal b; string c;}[]|csv:Error mrra = csv:parseStringToRecord(string `a, b,c
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

    record {|float a; decimal b; string c; int d;|}[]|csv:Error m2rra = csv:parseStringToRecord(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rra, [
        {a: <float>1, b: <decimal>1, c: "1", d: 1},
        {a: <float>0, b: <decimal>0, c: "0", d: 0},
        {a: <float>-1, b: <decimal>-1, c: "-1", d: -1}
    ]);

    record {int d;}[]|csv:Error m3rra = csv:parseStringToRecord(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rra is csv:Error);
    test:assertEquals((<csv:Error>m3rra).message(), common:generateErrorMessageForInvalidCast("1.0", "int"));
}

@test:Config
function testSpaceBetweendData() {
    string csv = string `a b, b  d  e, f
                         "Hello world", "  Hi I am ", \"  Hi I am \"`;

    record{|string...;|}[]|csv:Error rec = csv:parseStringToRecord(csv);
    test:assertEquals(rec, [
        {"a b":"Hello world","b  d  e":"  Hi I am ","f":"\"Hi I am \""}]);
}

@test:Config
function testParseBytes() returns error? {
    byte[] csvBytes = check io:fileReadBytes(filepath);

    record{}[]|csv:Error rec = csv:parseBytesToRecord(csvBytes, {});
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    string[][]|csv:Error rec2 = csv:parseBytesToList(csvBytes, {});
    test:assertEquals(rec2, [
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);
}

@test:Config
function testParseStream() returns error? {
    stream<byte[], io:Error?> csvByteStream = check io:fileReadBlocksAsStream(filepath);
    record{}[]|csv:Error rec = csv:parseStreamToRecord(csvByteStream, {});
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    string[][]|csv:Error rec2 = csv:parseStreamToList(csvByteStream, {});
    test:assertEquals(rec2, [
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);
}

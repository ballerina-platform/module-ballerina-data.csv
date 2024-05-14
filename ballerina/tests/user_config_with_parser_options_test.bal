import ballerina/test;

boolean enable = !true;

@test:Config {enable: !enable}
function debugTest() {
    string value = string `
        i1,i2,s1,s2,  b1,b2,n1,n2,f1,f2, d1,d2,j1,a1,j2,a2
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),${f1}, ${f2},${d1},${d2},${b1},${d1},${b2},${d2}
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),  ${f1},${f2},${d1},${d2},${b1},${d1},${b2},${d2}
    `;
    // string value2 = string `
    //     i1, s1, b1, n1, f1, d1, j1, a1, s2, s3, j2, a2
    //     ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3},${b2}, ${d2}
    // `;
    // string value3 = string `
    //     i1, s1, b1, n1, f1, d1, j1, a1, s2, s3
    //     ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3}
    // `;

    [int, string, boolean, decimal, float, string][]|CsvConversionError cv1baa = parseStringToList(csvStringData1, option3);
    test:assertEquals(cv1baa, [
        [1, "string1", true ,<decimal>2.234, <float>2.234, "()"],
        [1, "string2", false, <decimal>0, <float>0.0, "null"],
        [1, "string3", false, <decimal>1.23, <float>1.23, "()"],
        [1, "string4", true, <decimal>-6.51, <float>-6.51, "()"],
        [1, "string5", true, <decimal>3, <float>3.0, "()"]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithParserOptions() {
    [int, string, boolean, decimal, float, string][]|CsvConversionError cv1baa = parseStringToList(csvStringData1, option3);
    test:assertEquals(cv1baa, [
        [1, "string1", true ,<decimal>2.234, <float>2.234, "()"],
        [1, "string2", false, <decimal>0, <float>0.0, "null"],
        [1, "string3", false, <decimal>1.23, <float>1.23, "()"],
        [1, "string4", true, <decimal>-6.51, <float>-6.51, "()"],
        [1, "string5", true, <decimal>3, <float>3.0, "()"]
    ]);
}

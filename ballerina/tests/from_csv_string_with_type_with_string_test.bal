import ballerina/test;

@test:Config {enable}
function testFromCsvStringWithTypeForMapAndRecordAsExpectedType() {
    BooleanRecord1Array|CsvConversionError cv1br = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(cv1br, [
        {}
    ]);
}

// @test:Config {enable}
// function testFromCsvStringWithTypeForMapAndRecordAsExpectedType2() {
    
// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForMapAndMapAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForMapAndArrayAsExpectedType() {
    
// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForMapAndTupleAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForTupleAndRecordAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForTupleAndRecordAsExpectedType2() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForTupleAndTupleAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForTupleAndMapAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForTupleAndArrayAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeFunctionWithTypeCompatibility() {

// }

boolean enable = !true;

@test:Config {enable: !enable}
function test() {
    BooleanRecord1Array|CsvConversionError cv1br = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(cv1br, [
        {}
    ]);
}

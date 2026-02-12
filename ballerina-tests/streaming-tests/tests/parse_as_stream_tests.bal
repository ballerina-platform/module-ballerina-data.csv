// Copyright (c) 2026, WSO2 LLC. (https://www.wso2.com).
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

import ballerina/data.csv;
import ballerina/constraint;
import ballerina/io;
import ballerina/test;

type ConstrainedPerson record {
    @constraint:Int {
        maxValue: 30
    }
    int age;
    string name;
};

class TestByteStreamIterator {
    private int index = 0;
    private byte[][] chunks;
    private int errorAtIndex;
    private boolean closed = false;

    public function init(byte[][] chunks, int errorAtIndex = 0) {
        self.chunks = chunks;
        self.errorAtIndex = errorAtIndex;
    }

    public isolated function next() returns record {|byte[] value;|}?|error {
        byte[] chunk = [];
        boolean done = false;
        error? err = ();
        lock {
            self.index += 1;
            if self.errorAtIndex > 0 && self.index == self.errorAtIndex {
                err = error("boom");
            } else if self.index > self.chunks.length() {
                done = true;
            } else {
                byte[] src = self.chunks[self.index - 1];
                chunk = src.slice(0, src.length());
            }
        }
        if err is error {
            return err;
        }
        if done {
            return ();
        }
        return {value: chunk};
    }

    public isolated function close() returns error? {
        lock {
            self.closed = true;
        }
        return ();
    }

    public isolated function isClosed() returns boolean {
        lock {
            return self.closed;
        }
    }
}

// Test 1: Basic streaming yields all rows
@test:Config
function testBasicStreamingYieldsAllRows() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30
3,Charlie,35`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    Person[] result = check from Person p in personStream
        select p;

    test:assertEquals(result.length(), 3);
    test:assertEquals(result[0], {id: 1, name: "Alice", age: 25});
    test:assertEquals(result[1], {id: 2, name: "Bob", age: 30});
    test:assertEquals(result[2], {id: 3, name: "Charlie", age: 35});
}

// Test 2: Typed record mapping works
@test:Config
function testTypedRecordMapping() returns error? {
    string csvContent = string `title,author,year
Clean Code,Robert Martin,2008
The Pragmatic Programmer,Andy Hunt,1999`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Book, csv:Error?> bookStream = check csv:parseAsStream(byteStream);

    Book[] books = check from Book b in bookStream
        select b;

    test:assertEquals(books.length(), 2);
    test:assertEquals(books[0].title, "Clean Code");
    test:assertEquals(books[0].author, "Robert Martin");
    test:assertEquals(books[0].year, 2008);
    test:assertEquals(books[1].title, "The Pragmatic Programmer");
    test:assertEquals(books[1].author, "Andy Hunt");
    test:assertEquals(books[1].year, 1999);
}

// Test 3: Streaming with forEach
@test:Config
function testStreamingWithForEach() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30
3,Charlie,35`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    int count = 0;
    int totalAge = 0;
    check personStream.forEach(function(Person p) {
        count += 1;
        totalAge += p.age;
    });

    test:assertEquals(count, 3);
    test:assertEquals(totalAge, 90);
}

// Test 4: Fail-safe skips malformed rows without terminating stream
@test:Config
function testFailSafeSkipsMalformedRows() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,INVALID
3,Charlie,35`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream, {
        failSafe: {
            enableConsoleLogs: false
        }
    });

    Person[] result = [];
    check personStream.forEach(function(Person p) {
        result.push(p);
    });

    // In fail-safe mode, malformed rows should be skipped
    // So we should get 2 valid rows
    test:assertEquals(result.length(), 2);
    test:assertEquals(result[0].name, "Alice");
    test:assertEquals(result[1].name, "Charlie");
}

// Test 5: Empty CSV returns empty stream
@test:Config
function testEmptyCsv() returns error? {
    string csvContent = string `id,name,age`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    Person[] result = check from Person p in personStream
        select p;

    test:assertEquals(result.length(), 0);
}

// Test 6: Single row CSV
@test:Config
function testSingleRowCsv() returns error? {
    string csvContent = string `id,name,age
1,Alice,25`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    Person[] result = check from Person p in personStream
        select p;

    test:assertEquals(result.length(), 1);
    test:assertEquals(result[0], {id: 1, name: "Alice", age: 25});
}

// Test 7: Array type output
@test:Config
function testArrayTypeOutput() returns error? {
    string csvContent = string `1,Alice,25
2,Bob,30`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<anydata[], csv:Error?> arrayStream = check csv:parseAsStream(byteStream, {header: null});

    anydata[][] result = check from anydata[] row in arrayStream
        select row;

    test:assertEquals(result.length(), 2);
    // When parsing to anydata[], values are type-inferred (numbers become integers)
    test:assertEquals(result[0], [1, "Alice", 25]);
    test:assertEquals(result[1], [2, "Bob", 30]);
}

// Test 8: Custom header options
@test:Config
function testCustomHeaderOptions() returns error? {
    string csvContent = string `1,Alice,25
2,Bob,30`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream, {
        header: null,
        customHeadersIfHeadersAbsent: ["id", "name", "age"]
    });

    Person[] result = check from Person p in personStream
        select p;

    test:assertEquals(result.length(), 2);
    test:assertEquals(result[0].name, "Alice");
    test:assertEquals(result[1].name, "Bob");
}

// Test 9: Large-ish CSV (memory efficiency test)
@test:Config
function testLargeCsv() returns error? {
    // Generate a CSV with 1000 rows
    string[] lines = ["id,name,age"];
    foreach int i in 1 ... 1000 {
        lines.push(string `${i},Person${i},${20 + (i % 50)}`);
    }
    string csvContent = string:'join("\n", ...lines);

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    int count = 0;
    check personStream.forEach(function(Person p) {
        count += 1;
    });

    test:assertEquals(count, 1000);
}

// Test 10: Readonly record type (INTERSECTION_TAG)
@test:Config
function testReadonlyRecordType() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person & readonly, csv:Error?> personStream = check csv:parseAsStream(byteStream);

    (Person & readonly)[] result = check from Person & readonly p in personStream
        select p;

    test:assertEquals(result.length(), 2);
    test:assertEquals(result[0], {id: 1, name: "Alice", age: 25});
    test:assertEquals(result[1], {id: 2, name: "Bob", age: 30});
    // Verify it's actually readonly
    test:assertTrue(result[0] is readonly);
    test:assertTrue(result[1] is readonly);
}

// Test 11: Union type resolution (each row resolved independently)
@test:Config
function testUnionTypeResolution() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<Person|Book, csv:Error?> unionStream = check csv:parseAsStream(byteStream);

    (Person|Book)[] result = check from Person|Book item in unionStream
        select item;

    test:assertEquals(result.length(), 2);
    // Each row is resolved independently - both match Person (has id, name, age)
    test:assertTrue(result[0] is Person);
    test:assertTrue(result[1] is Person);
    test:assertEquals((<Person>result[0]).name, "Alice");
    test:assertEquals((<Person>result[1]).name, "Bob");
}

// Test 12: Underlying byte stream error is propagated
@test:Config
function testStreamErrorPropagation() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30`;

    byte[][] chunks = createByteChunks(csvContent);
    TestByteStreamIterator iterator = new (chunks, 2);
    stream<byte[], error?> byteStream = new (iterator);

    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);
    error? err = personStream.forEach(function(Person p) {
    });

    test:assertTrue(err is csv:Error);
    if err is error {
        test:assertTrue(err.message().includes("boom"));
    }
}

// Test 13: Constraint validation error surfaces as stream error
@test:Config
function testConstraintValidationErrorInStream() returns error? {
    string csvContent = string `age,name
40,Alice`;

    byte[][] chunks = createByteChunks(csvContent);
    stream<byte[], error?> byteStream = new (new TestByteStreamIterator(chunks));
    stream<ConstrainedPerson, csv:Error?> constrainedStream = check csv:parseAsStream(byteStream);

    error? err = constrainedStream.forEach(function(ConstrainedPerson p) {
    });

    test:assertTrue(err is csv:Error);
    if err is error {
        test:assertTrue(err.message().startsWith("Validation failed"));
    }
}

// Test 14: Early close releases underlying byte stream
@test:Config
function testEarlyCloseReleasesByteStream() returns error? {
    string csvContent = string `id,name,age
1,Alice,25
2,Bob,30`;

    byte[][] chunks = createByteChunks(csvContent);
    TestByteStreamIterator iterator = new (chunks);
    stream<byte[], error?> byteStream = new (iterator);

    stream<Person, csv:Error?> personStream = check csv:parseAsStream(byteStream);
    check personStream.close();
    test:assertTrue(iterator.isClosed());
}

// Test 15: Databound failure - row doesn't match any union member type
@test:Config
function testDataboundFailure() returns error? {
    // Data with string values that can't convert to int or boolean
    string csvContent = string `a,b
hello,world`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    // Neither IntRecord nor BoolRecord can match "hello,world"
    stream<IntRecord|BoolRecord, csv:Error?> unionStream = check csv:parseAsStream(byteStream);

    error? err = unionStream.forEach(function(IntRecord|BoolRecord item) {
    });

    test:assertTrue(err is csv:Error);
    if err is error {
        test:assertTrue(err.message().includes("cannot convert"));
    }
}

// Test 16: Mixed union type resolution - each row resolved independently
@test:Config
function testMixedUnionTypeResolution() returns error? {
    // First row matches IntRecord, second row also matches IntRecord
    string csvContent = string `a,b
1,2
3,4`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<IntRecord|BoolRecord, csv:Error?> unionStream = check csv:parseAsStream(byteStream);

    (IntRecord|BoolRecord)[] result = check from IntRecord|BoolRecord item in unionStream
        select item;

    test:assertEquals(result.length(), 2);
    test:assertTrue(result[0] is IntRecord);
    test:assertTrue(result[1] is IntRecord);
    test:assertEquals((<IntRecord>result[0]).a, 1);
    test:assertEquals((<IntRecord>result[1]).a, 3);
}

// Test 17: Databound failure with failSafe - skips failing rows
@test:Config
function testDataboundFailureWithFailSafe() returns error? {
    // Row 1: matches IntRecord, Row 2: doesn't match either, Row 3: matches IntRecord
    string csvContent = string `a,b
1,2
hello,world
3,4`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<IntRecord|BoolRecord, csv:Error?> unionStream = check csv:parseAsStream(byteStream, {
        failSafe: {
            enableConsoleLogs: false
        }
    });

    (IntRecord|BoolRecord)[] result = [];
    check unionStream.forEach(function(IntRecord|BoolRecord item) {
        result.push(item);
    });

    // Row 2 should be skipped, so we get 2 rows
    test:assertEquals(result.length(), 2);
    test:assertEquals((<IntRecord>result[0]).a, 1);
    test:assertEquals((<IntRecord>result[1]).a, 3);
}

// Test 18: Tuple union type with databound failure
@test:Config
function testTupleUnionDataboundFailure() returns error? {
    // Data that doesn't match either IntTuple or BoolTuple
    string csvContent = string `hello,world`;

    stream<byte[], io:Error?> byteStream = createByteStream(csvContent);
    stream<IntTuple|BoolTuple, csv:Error?> tupleStream = check csv:parseAsStream(byteStream, {header: null});

    error? err = tupleStream.forEach(function(IntTuple|BoolTuple item) {
    });

    test:assertTrue(err is csv:Error);
}

// Helper function to create byte stream from string
function createByteStream(string content) returns stream<byte[], io:Error?> {
    return createByteChunks(content).toStream();
}

function createByteChunks(string content) returns byte[][] {
    byte[] bytes = content.toBytes();
    byte[][] chunks = [];

    // Split into chunks of ~64 bytes for more realistic streaming
    int chunkSize = 64;
    int i = 0;
    while i < bytes.length() {
        int end = (i + chunkSize < bytes.length()) ? i + chunkSize : bytes.length();
        chunks.push(bytes.slice(i, end));
        i = end;
    }

    return chunks;
}

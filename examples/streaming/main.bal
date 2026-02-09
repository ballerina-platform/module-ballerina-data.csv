// Copyright (c) 2026, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/data.csv;

// Define the record type for CSV rows
type Person record {
    int id;
    string name;
    int age;
    string city;
};

public function main() returns error? {
    io:println("=== CSV Streaming Example ===\n");

    // Open the CSV file as a byte stream
    stream<byte[], io:Error?> csvByteStream = check io:fileReadBlocksAsStream("sample_data.csv");

    // Parse the stream - this returns a stream of Person records
    // Each record is parsed on-demand, making it memory efficient for large files
    stream<Person, csv:Error?> personStream = check csv:parseAsStream(csvByteStream);

    io:println("Processing CSV records one at a time:\n");

    int count = 0;

    // Iterate through the stream - each record is parsed as needed
    check personStream.forEach(function(Person person) {
        count += 1;
        io:println(string `Record ${count}:`);
        io:println(string `  ID: ${person.id}`);
        io:println(string `  Name: ${person.name}`);
        io:println(string `  Age: ${person.age}`);
        io:println(string `  City: ${person.city}`);
        io:println();
    });

    io:println(string `\nTotal records processed: ${count}`);
    io:println("\n=== Streaming Example Complete ===");
}

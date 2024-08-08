# Ballerina CSV Data Library

The Ballerina CSV Data Library is a comprehensive toolkit designed to facilitate the handling and manipulation of CSV data within Ballerina applications. It streamlines the process of converting CSV data to native Ballerina data types, enabling developers to work with CSV content seamlessly and efficiently.

## Features

- **Versatile CSV Data Input**: Accept CSV data as a string, byte array, or a stream and convert it into a subtype of ballerina records or lists.
- **CSV to anydata Value transformation**: Transform CSV data into expected type which is subtype of ballerina record arrays or anydata arrays.
- **Projection Support**: Perform selective conversion of CSV data subsets into ballerina record array or anydata array values through projection.

## Usage

### Converting CSV string to a record array

To convert a CSV string into a record array value, you can use the `parseString` function from the library. The following example demonstrates how to transform a CSV document into an array of records.

```ballerina
import ballerina/data.csv;
import ballerina/io;

type Book record {
    string name;
    string author;
    int year;
};

public function main() returns error? {
    string csvString = string `name,author,year
                               Clean Code,Robert C. Martin,2008
                               The Pragmatic Programmer,Andrew Hunt and David Thomas,1999`;

    Book[] books = check csv:parseString(csvString);
    foreach var book in books {
        io:println(book);
    }
}
```

### Converting external CSV document to a record value

For transforming CSV content from an external source into a record value, the `parseString`, `parseBytes` and `parseStream` functions can be used. This external source can be in the form of a string or a byte array/byte-block-stream that houses the CSV data. This is commonly extracted from files or network sockets. The example below demonstrates the conversion of an CSV value from an external source into a record value.

```ballerina
import ballerina/data.csv;
import ballerina/io;

type Book record {
    string name;
    string author;
    int year;
};

public function main() returns error? {
    // Read the CSV content as a string
    string csvContent = check io:fileReadString("path/to/file.csv");
    Book[] book = check csv:parseString(csvContent);
    io:println(book);

    // Read the CSV content as a stream
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("path/to/file.csv");
    Book[] book2 = check csv:parseStream(csvStream);
    io:println(book2);
}
```

Make sure to handle possible errors that may arise during the file reading or CSV to record/array conversion process. The `check` keyword is utilized to handle these errors, but more sophisticated error handling can be implemented as per your requirements.

## CSV to record array/anydata array of array representation

The CSV Object can be represented as a value of type `record/map array` or `string array of array` in Ballerina, which facilitates a structured and type-safe approach to handling CSV data.
The conversion of CSV data to subtype of `record array` or `anydata array of array` representation is a fundamental feature of the library.

```ballerina
import ballerina/data.csv;
import ballerina/io;

type Book record {
    string name;
    int year;
};

public function main() returns error? {
    string[][] bookArray = [["Clean Code","2008"],["Clean Architecture","2017"]];
    Book[] bookRecords = [{name: "Clean Code", year: 2008}, {name: "Clean Architecture", year: 2017}];

    // Parse and output a record array from a source of string array of arrays.
    Book[] books = check csv:parseList(bookArray, {customHeaders: ["name", "year"]});
    io:println(books);

    // Parse and output a tuple array from a source of string array of arrays.
    [string, int][] books2 = check csv:parseList(bookArray, {customHeaders: ["name", "year"]});
    io:println(books2);

    // Transform CSV records to a string array of arrays.
    [string, int][] books3 = check csv:transform(bookRecords);
    io:println(books3);
}
```

### Controlling the CSV value to record array conversion

The library allows for selective conversion of CSV into closed record arrays. This is beneficial when the CSV data contains headers that are not necessary to be transformed into record fields.

```ballerina
import ballerina/data.csv;
import ballerina/io;

type Book record {|
    string name;
    string author;
|};

public function main() returns error? {
    record{}[] csvContent = [{
        "name": "Clean Code",
        "author": "Robert C. Martin",
        "year": 2008,
        "publisher": "Prentice Hall"
    }, {
        "name": "The Pragmatic Programmer",
        "author": "Andrew Hunt and David Thomas",
        "year": 1999,
        "publisher": "Addison-Wesley"
    }];

    // The CSV data above contains publisher and year fields which are not 
    // required to be converted into a record field.
    Book[] book = check csv:transform(csvContent);
    io:println(book);
}
```

However, if the rest field is utilized (or if the record type is defined as an open record), all members in the CSV data will be transformed into record fields:

```ballerina
type Book record {
    string name;
    string author;
}
```

In this instance, all other CSV header values, such as `year` and `publisher` will be transformed into `anydata-typed` fields with the corresponding CSV header as the key-value pair.

This behavior extends to arrays as well.

The process of projecting CSV data into a record supports various use cases, including the filtering out of unnecessary members. This functionality is anticipated to be enhanced in the future to accommodate more complex scenarios, such as filtering values based on regular expressions, among others.

## Issues and projects

Issues and Projects tabs are disabled for this repository as this is part of the Ballerina library. To report bugs, request new features, start new discussions, view project boards, etc. please visit Ballerina library [parent repository](https://github.com/ballerina-platform/ballerina-library).

This repository only contains the source code for the package.

## Useful links

* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.

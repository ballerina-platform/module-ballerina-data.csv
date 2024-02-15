# Package overview

This package is designed to facilitate the handling and manipulation of CSV data within Ballerina applications. It streamlines the process of converting CSV data to native Ballerina data types, enabling developers to work with CSV content seamlessly and efficiently.

This library is the refined successor of the `ballerina/csvdata` module, incorporating enhanced functionalities and improved performance.

## Features

- **Versatile CSV Data Input**: Accept CSV data as a csv, a string, byte array, or a stream and convert it into a Record value.
- **CSV to Record Value Conversion**: Transform CSV data into Ballerina records with ease in compliance with OpenAPI 3 standards.
- **Projection Support**: Perform selective conversion of CSV data subsets into Record values through projection.

## Usage

### Converting an CSV value to a Record value

To convert an CSV value to a Record value, you can utilize the `fromCsvWithType` function provided by the library. The example below showcases the transformation of an CSV value into a Record value.

```ballerina
import ballerina/data.csv as csvdata;
import ballerina/io;

public function main() returns error? {
    csv data = csv `<book>
        <id>0</id>
        <title>string</title>
        <author>string</author>
    </book>`;

    Book book = check csvdata:fromCsvWithType(data, Book);
    io:println(book);
}

type Book record {
    int id;
    string title;
    string author;
};
```

### Converting an external CSV document to a Record value

For transforming CSV content from an external source into a Record value, the `fromCsvStringWithType` function can be used. This external source can be in the form of a string or a byte array/byte stream that houses the CSV data. This is commonly extracted from files or network sockets. The example below demonstrates the conversion of an CSV value from an external source into a Record value.

```ballerina
import ballerina/data.csv as csvdata;
import ballerina/io;

public function main() returns error? {
    string csvContent = check io:fileReadString("path/to/file.csv");
    Book book = check csvdata:fromCsvStringWithType(csvContent, Book);
    io:println(book);
}

type Book record {
    int id;
    string title;
    string author;
};
```

Make sure to handle possible errors that may arise during the file reading or CSV to record conversion process. The `check` keyword is utilized to handle these errors, but more sophisticated error handling can be implemented as per your requirements.

## CSV to Record Canonical Representation

The translation of CSV to a Record representation is a fundamental feature of the library. It facilitates a structured and type-safe approach to handling CSV data within Ballerina applications.

Take for instance the following CSV snippet:

```csv
<book>
    <id>0</id>
    <title>string</title>
    <author>string</author>
</book>
```

CSV data is inherently hierarchical, forming a tree structure. In the given example, the root element is `book`, which encompasses three child elements: `id`, `title`, and `author`. The `id` element harbors a numeric value `0`, whereas both the `title` and `author` elements contain string values.

A straightforward record representation of the above CSV data is:

```ballerina
type Book record {
    int id;
    string title;
    string author;
};
```

In this representation, the CSV data is efficiently translated into a record value. The `book` element is mapped to a record of type `Book`, and the child elements `id`, `title`, and `author` are converted into record fields of types `int` and `string` correspondingly.

This record type definition can be further refined through annotations. Moreover, utilizing open and closed records grants control over the translation process, which is elaborated in subsequent sections.

### CSV Element Names

The name of the CSV element serves as the name of the record field, altered to fit a valid Ballerina identifier. Notably, the record field name corresponds to the local name of the CSV element, with any namespace prefixes being disregarded.

Consider the CSV snippet:

```csv
<book>
    <id>0</id>
    <title-name>string</title-name>
    <author-name>string</author-name>
</book>
```

The canonical representation of the above CSV as a Ballerina record is:

```ballerina
type Book record {
    int id;
    string 'title\-name';
    string 'author\-name';
};
```

Observe how the CSV element names `title-name` and `author-name` are represented using delimited identifiers in Ballerina; the `-` characters in the CSV element names are escaped using the `\` character.

Moreover, the `@Name` annotation can be utilized to explicitly specify the name of the record field, providing control over the translation process:

```ballerina
import ballerina/data.csv as csvdata;

type Book record {
    int id;
    @csvdata:Name { value: "title-name" }
    string title;
    @csvdata:Name { value: "author-name" }
    string author;
};
```

### CSV Attributes

Similarly to CSV elements, CSV attributes are also represented into record fields within the corresponding parent Record type. The name of the CSV attribute is converted into the name of the record field, ensuring it is a valid Ballerina identifier. It is crucial to emphasize that the record field name aligns with the local name of the CSV attribute, and any namespace prefixes are ignored.

Consider the following CSV snippet:

```csv
<book lang="en" price="10.5">
    <id>0</id>
    <title>string</title>
    <author>string</author>
</book>
```

The canonical representation of the above CSV as a Ballerina record is:

```ballerina
type Book record {
    string lang;
    decimal price;
    int id;
    string title;
    string author;
};
```

Additionally the `@Attribute` annotation can be utilized to explicitly specify the name of the record field, providing control over the translation process.

### Child Elements

Child elements are mapped to record fields, with the type reflecting that of the corresponding child element.

Examine the CSV snippet below:

```csv
<book>
    <id>0</id>
    <title>string</title>
    <author>
        <name>string</name>
        <country>string</country>
    </author>
</book>
```

The canonical representation of the above CSV as a Ballerina record is:

```ballerina
type Book record {
    int id;
    string title;
    Author author;
};

type Author record {
    string name;
    string country;
};
```

In this transformation, child elements, like the `author` element containing its own sub-elements, are converted into nested records. This maintains the hierarchical structure of the CSV data within the Ballerina type system, enabling intuitive and type-safe data manipulation.

Alternatively, inline type definitions offer a compact method for representing child elements as records within their parent record. This approach is particularly beneficial when the child record does not require reuse elsewhere and is unique to its parent record.

Consider the subsequent Ballerina record definition, which employs inline type definition for the `author` field:

```ballerina
type Book record {
    int id;
    string title;
    record {
        string name;
        string country;
    } author;
};
```

### CSV Text Content

The transformation of CSV text content into record fields typically involves types like `string`, `boolean`, `int`, `float`, or `decimal`, depending on the textual content. For numeric values where type information is not explicitly defined, the default conversion type is `decimal`. Conversely, for non-numeric content, the default type is `string`.

Consider the CSV snippet below:

```csv
<book>
    <id>0</id>
    <title>string</title>
    <author>string</author>
    <available>true</available>
    <price>10.5</price>
</book>
```

The translation into a Ballerina record would be as follows:

```ballerina
type Book record {
    int id;
    string title;
    string author;
    boolean available;
    decimal price;
};
```

In scenarios where the parent CSV element of text content also includes attributes, the CSV text content can be represented by a `string` type field named `#content` within a record type, with the attributes being mapped to their respective fields.

For instance, examine this CSV:

```csv
<book>
    <id>0</id>
    <title lang="en">string</title>
    <price>10.5</price>
</book>
```

The canonical translation of CSV to a Ballerina record is as such:

```ballerina
type Book record {
    int id;
    Title title;
    decimal price;
};

type Title record {
    string \#content;
    string lang;
};
```

Modifications to the default behavior for converting numerical values can be achieved by providing `Options` mappings to the respective functions. This enables developers to choose specific data types and exert finer control over the conversion process.

### CSV Namespaces

CSV namespaces are accommodated by the library, supporting the translation of CSV data that contains namespace prefixes. However, the presence of CSV namespaces is not mandatory, and the library is capable of processing CSV data without namespaces. Should namespaces be present, they will be utilized to resolve the names of CSV elements and attributes.

It's important to note that, unlike in the `csvdata` module, the namespace prefixes do not reflect in the record field names, as the record field names align with the local names of the CSV elements.

Examine the CSV snippet below with default namespaces:

```csv
<book csvns="http://example.com/book">
    <id>0</id>
    <title>string</title>
    <author>string</author>
</book>
```

The translation into a Ballerina record would be:

```ballerina
type Book record {
    int id;
    string title;
    string author;
};
```

Incorporating namespace validation yields:

```ballerina
import ballerina/data.csv as csvdata;

@csvdata:Namespace {
    uri: "http://example.com/book"
}
type Book record {
    int id;
    string title;
    string author;
};
```

Here is the same CSV snippet with a namespace prefix:

```csv
<bk:book csvns:bk="http://example.com/book">
    <bk:id>0</bk:id>
    <bk:title>string</bk:title>
    <bk:author>string</bk:author>
</bk:book>
```

The translation into a Ballerina record would be:

```ballerina
import ballerina/data.csv as csvdata;

@csvdata:Namespace {
    uri: "http://example.com/book",
    prefix: "bk"
}
type Book record {
    int id;
    string title;
    string author;
};
```

In these examples, the CSV namespaces are appropriately acknowledged, ensuring the integrity of the CSV structure within the Ballerina records.

### Working with Arrays

The library is equipped to handle the transformation of CSV data containing arrays into Ballerina records.

Take the following CSV snippet as an example:

```csv
<book>
    <id>0</id>
    <title>string</title>
    <author>string</author>
    <author>string</author>
    <author>string</author>
</book>
```

The canonical representation of this CSV as a Ballerina record is:

```ballerina
type Book record {
    int id;
    string title;
    string[] author;
};
```

### Controlling Which Elements to Convert

The library allows for selective conversion of CSV elements into records through the use of rest fields. This is beneficial when the CSV data contains elements that are not necessary to be transformed into record fields.

Take this CSV snippet as an example:

```csv
<book lang="en">
    <id>0</id>
    <title lang="en">string</title>
    <author>string</author>
    <price>10.5</price>
</book>
```

Suppose that only the book `id`, and `title` elements are needed for conversion into record fields. This can be achieved by defining only the required fields in the record type and omitting the rest field:

```ballerina
type Book record {|
    int id;
    string title;
|};
```

However, if the rest field is utilized (or if the record type is defined as an open record), all elements in the CSV data will be transformed into record fields:

```ballerina
type Book record {
    int id;
    string title;
};
```

In this instance, all other elements in the CSV data, such as `author` and `price` along with their attributes, will be transformed into `string` type fields with the corresponding element name as the key.

This behavior extends to arrays as well.

The process of projecting CSV data into a record supports various use cases, including the filtering out of unnecessary elements. This functionality is anticipated to be enhanced in the future to accommodate more complex scenarios, such as filtering values based on regular expressions, among others.

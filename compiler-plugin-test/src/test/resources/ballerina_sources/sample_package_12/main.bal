import ballerina/data.csv;

string[]? headers = ();

[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ["a", "b"]});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ()});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: headers});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ["a", "b"]});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ()});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: headers});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ["a", "b"]});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ()});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: null, outputWithHeaders: false});
[anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: headers});

public function main() returns error? {
    [anydata...][] val = check csv:parseList([["1", "2"]], {headersRows: 0});
    val = check csv:parseList([["1", "2"]], {headersRows: 0});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ["a", "b"]});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: ()});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headersRows: 0, customHeaders: headers});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1});
    val = check csv:parseList([["1", "2"]], {headersRows: 1});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ["a", "b"]});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: ()});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headersRows: 1, customHeaders: headers});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2});
    val = check csv:parseList([["1", "2"]], {headersRows: 2});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ["a", "b"]});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: ()});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: null, outputWithHeaders: true});
    val = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: null, outputWithHeaders: true});

    [anydata...][] _ = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headersRows: 2, customHeaders: headers});
}

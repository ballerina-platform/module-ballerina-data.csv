import ballerina/data.csv;

string[]? headers = ();

record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ["a", "b"]});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ()});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: headers});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ["a", "b"]});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ()});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: headers});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ["a", "b"]});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ()});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: null, outputWithHeaders: false});
record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: headers});

public function main() returns error? {
    record {}[] val = check csv:parseList([["1", "2"]], {headerRows: 0});
    val = check csv:parseList([["1", "2"]], {headerRows: 0});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ["a", "b"]});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: ()});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headerRows: 0, customHeaders: headers});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1});
    val = check csv:parseList([["1", "2"]], {headerRows: 1});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ["a", "b"]});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: ()});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headerRows: 1, customHeaders: headers});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2});
    val = check csv:parseList([["1", "2"]], {headerRows: 2});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ["a", "b"]});
    val = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ["a", "b"]});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ()});
    val = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: ()});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: null, outputWithHeaders: true});
    val = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: null, outputWithHeaders: true});

    record {}[] _ = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: headers});
    val = check csv:parseList([["1", "2"]], {headerRows: 2, customHeaders: headers});
}

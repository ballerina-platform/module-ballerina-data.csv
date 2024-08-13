import ballerina/data.csv;

string[] customHeaders = ["a", "b"];
int:Unsigned32 header = 0;
false header2 = false;

record{}[] val = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
record{}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
record{}[] val3 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: ["a", "b"]});
record{}[] val4 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: ()});
record{}[] val5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
record{}[] val6 = check csv:parseString(string `a, b`, {header: false});
record{}[] val7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
record{}[] val8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
record{}[] val9 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: null});
record{}[] val10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
record{}[] val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
record{}[] val12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});

public function main() returns error? {
    record{}[] val = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    val = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    record{}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
    val2 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ()});

    record{}[] val3 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: ["a", "b"]});
    val3 = check csv:parseString(string ``, {header: false, customHeadersIfHeadersAbsent: ["a", "b"]});

    record{}[] val4 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: ()});
    val4 = check csv:parseString(string ``, {header: false, customHeadersIfHeadersAbsent: ()});

    record{}[] val5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
    val5 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ()});

    record{}[] val6 = check csv:parseString(string `a, b`, {header: false});
    val6 = check csv:parseString(string ``, {header: false});

    record{}[] val7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
    val7 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ["a", "b"]});

    record{}[] val8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
    val8 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: null});

    record{}[] val9 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: null});
    val9 = check csv:parseString(string ``, {header: false, customHeadersIfHeadersAbsent: null});

    record{}[] val10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
    val10 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: customHeaders});

    record{}[] val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});

    record{}[] val12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
}

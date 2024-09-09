import ballerina/data.csv;

string[] customHeaders = ["a", "b"];
int:Unsigned32 header = 0;
()|null header2 = null;

record {}[] val = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
record {}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
record {}[] val3 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ["a", "b"]});
record {}[] val4 = check csv:parseString(string `a, b`, {header: null, customHeadersIfHeadersAbsent: ()});
record {}[] val5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
record {}[] val6 = check csv:parseString(string `a, b`, {header: ()});
record {}[] val7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
record {}[] val8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
record {}[] val9 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: null});
record {}[] val10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
record {}[] val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
record {}[] val12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
record {}[]|error val13 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
record {}[]|[int...][]|error val14 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

anydata[][] arrVal = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
anydata[][] arrVal2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
anydata[][] arrVal3 = check csv:parseString(string `a, b`, {header: null, customHeadersIfHeadersAbsent: ["a", "b"]});
anydata[][] arrVal4 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ()});
anydata[][] arrVal5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
anydata[][] arrVal6 = check csv:parseString(string `a, b`, {header: ()});
anydata[][] arrVal7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
anydata[][] arrVal8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
anydata[][] arrVal9 = check csv:parseString(string `a, b`, {header: null, customHeadersIfHeadersAbsent: null});
anydata[][] arrVal10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
anydata[][] arrVal11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
anydata[][] arrVal12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
anydata[][]|error arrVal13 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
anydata[][]|[int...][]|error arrVal14 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

public function main() returns error? {
    record {}[] val = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    val = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    record {}[]|error val_2 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    val_2 = csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    record {}[]|record {int a;}[]|error val_3 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    val_3 = csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    record {}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
    val2 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ()});

    record {}[] val3 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ["a", "b"]});
    val3 = check csv:parseString(string ``, {header: (), customHeadersIfHeadersAbsent: ["a", "b"]});

    record {}[] val4 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ()});
    val4 = check csv:parseString(string ``, {header: null, customHeadersIfHeadersAbsent: ()});

    record {}[] val5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
    val5 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ()});

    record {}[] val6 = check csv:parseString(string `a, b`, {header: null});
    val6 = check csv:parseString(string ``, {header: ()});

    record {}[] val7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
    val7 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ["a", "b"]});

    record {}[] val8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
    val8 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: null});

    record {}[] val9 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: null});
    val9 = check csv:parseString(string ``, {header: (), customHeadersIfHeadersAbsent: null});

    record {}[] val10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
    val10 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: customHeaders});

    record {}[] val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});

    record {}[] val12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});

    anydata[][] arrVal = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    val = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    anydata[][]|error arrVal_2 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    arrVal_2 = csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    anydata[][]|[anydata...][]|error arrVal_3 = csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});
    arrVal_3 = csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"]});

    anydata[][] arrVal2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ()});
    val2 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ()});

    anydata[][] arrVal3 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ["a", "b"]});
    val3 = check csv:parseString(string ``, {header: (), customHeadersIfHeadersAbsent: ["a", "b"]});

    anydata[][] arrVal4 = check csv:parseString(string `a, b`, {header: (), customHeadersIfHeadersAbsent: ()});
    val4 = check csv:parseString(string ``, {header: (), customHeadersIfHeadersAbsent: ()});

    anydata[][] arrVal5 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ()});
    val5 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ()});

    anydata[][] arrVal6 = check csv:parseString(string `a, b`, {header: ()});
    val6 = check csv:parseString(string ``, {header: null});

    anydata[][] arrVal7 = check csv:parseString(string `a, b`, {customHeadersIfHeadersAbsent: ["a", "b"]});
    val7 = check csv:parseString(string ``, {customHeadersIfHeadersAbsent: ["a", "b"]});

    anydata[][] arrVal8 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: null});
    val8 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: null});

    anydata[][] arrVal9 = check csv:parseString(string `a, b`, {header: null, customHeadersIfHeadersAbsent: null});
    val9 = check csv:parseString(string ``, {header: (), customHeadersIfHeadersAbsent: null});

    anydata[][] arrVal10 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: customHeaders});
    val10 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: customHeaders});

    anydata[][] arrVal11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string `a, b`, {header: header, customHeadersIfHeadersAbsent: customHeaders});

    anydata[][] arrVal12 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
    val11 = check csv:parseString(string ``, {header: header2, customHeadersIfHeadersAbsent: customHeaders});
}

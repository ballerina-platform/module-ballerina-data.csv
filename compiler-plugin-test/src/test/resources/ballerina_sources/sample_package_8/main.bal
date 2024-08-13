import ballerina/data.csv;

boolean o = false;
record{}[] val = check csv:parseString(string `a, b`, {outputWithHeaders: false});
record{}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: true});
record{}[] val3 = check csv:parseString(string `a, b`, {header: false, customHeadersIfHeadersAbsent: ["a", "b"]});
record{}[] val4 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: o});

public function main() returns error? {
    record{}[] val = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"], outputWithHeaders: false});
    val = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: ["a", "b"], outputWithHeaders: true});

    record{}[] val2 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: false});
    val2 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: true});

    record{}[] val3 = check csv:parseString(string `a, b`, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: o});
    val3 = check csv:parseString(string ``, {header: 0, customHeadersIfHeadersAbsent: (), outputWithHeaders: o});
}

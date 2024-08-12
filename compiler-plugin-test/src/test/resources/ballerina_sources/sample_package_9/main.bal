import ballerina/data.csv;

boolean o = false;
string[] headersOrder = ["a", "b"];
record{}[] val = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ["a", "b"], outputWithHeaders: false});
record{}[] val2 = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ["a", "b"]});
record{}[] val3 = check csv:transform([{"a": 1, "b": 2}], {"header": false, headersOrder: headersOrder});
record{}[] val4 = check csv:transform([{"a": 1, "b": 2}], {outputWithHeaders: o, headersOrder: ()});

public function main() returns error? {
    record{}[] val = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ()});
    val = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ()});

    record{}[] val2 = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ["a", "b"], outputWithHeaders: false});
    val2 = check csv:transform([{"a": 1, "b": 2}], {headersOrder: ["a", "b"], outputWithHeaders: true});

    record{}[] val3 = check csv:transform([{"a": 1, "b": 2}], {headersOrder: null});
    val3 = check csv:transform([{"a": 1, "b": 2}], {headersOrder: null});

    record{}[] val4 = check csv:transform([{"a": 1, "b": 2}], {headersOrder});
    val4 = check csv:transform([{"a": 1, "b": 2}], {headersOrder});
}

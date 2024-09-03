import ballerina/data.csv;

boolean o = false;
string[] headerOrder = ["a", "b"];
record {}[] val = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ["a", "b"], outputWithHeaders: false});
record {}[] val2 = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ["a", "b"]});
record {}[] val3 = check csv:transform([{"a": 1, "b": 2}], {"header": false, headerOrder: headerOrder});
record {}[] val4 = check csv:transform([{"a": 1, "b": 2}], {outputWithHeaders: o, headerOrder: ()});

public function main() returns error? {
    record {}[] val = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ()});
    val = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ()});

    record {}[] val2 = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ["a", "b"], outputWithHeaders: false});
    val2 = check csv:transform([{"a": 1, "b": 2}], {headerOrder: ["a", "b"], outputWithHeaders: true});

    record {}[] val3 = check csv:transform([{"a": 1, "b": 2}], {headerOrder: null});
    val3 = check csv:transform([{"a": 1, "b": 2}], {headerOrder: null});

    record {}[] val4 = check csv:transform([{"a": 1, "b": 2}], {headerOrder});
    val4 = check csv:transform([{"a": 1, "b": 2}], {headerOrder});
}

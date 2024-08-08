import ballerina/data.csv;

type A [[int, string], [int, string]];
stream<byte[], error?> s = (<byte[][]> [[1, 2, 3, 4, 5]]).toStream();

[[int, string], [int, string]] val = check csv:parseString(string `a,b`, {});
[record{}, record{}, record{}, record{}] val2 = check csv:parseString(string `a,b`, {});
[[int, string], [int, string]] val3 = check csv:parseStream(s, {});
[record{}, record{}, record{}, record{}] val4 = check csv:parseStream(s, {});
A val5 = check csv:parseBytes([1,2,3], {});
record{}[]|[record{}, record{}, record{}, record{}] val6 = check csv:parseBytes([1,2,3], {});
int[][]|[[int, string], [int, string]] val7 = check csv:transform([{}], {});
[[int, string], [int, string]] val8 = check csv:parseLists([], {});
[record{}, record{}, record{}, record{}] val9 = check csv:transform([{}], {});
[record{}, record{}, record{}, record{}] val10 = check csv:parseLists([], {});
record{}[2] val11 = check csv:parseLists([], {});
int[3][2] val12 = check csv:parseLists([], {});

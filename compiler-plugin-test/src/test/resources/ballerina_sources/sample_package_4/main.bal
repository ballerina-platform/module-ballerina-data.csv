import ballerina/data.csv;

type A [[int, string], [int, string]];
stream<byte[], error?> s = (<byte[][]> [[1, 2, 3, 4, 5]]).toStream();

[[int, string], [int, string]] val = check csv:parseStringToList(string `a,b`, {});
[record{}, record{}, record{}, record{}] val2 = check csv:parseStringToRecord(string `a,b`, {});
[[int, string], [int, string]] val3 = check csv:parseStreamToList(s, {});
[record{}, record{}, record{}, record{}] val4 = check csv:parseStreamToRecord(s, {});
A val5 = check csv:parseBytesToList([1,2,3], {});
record{}[]|[record{}, record{}, record{}, record{}] val6 = check csv:parseBytesToRecord([1,2,3], {});
int[][]|[[int, string], [int, string]] val7 = check csv:parseRecordAsListType([{}], [], {});
[[int, string], [int, string]] val8 = check csv:parseListAsListType([], {});
[record{}, record{}, record{}, record{}] val9 = check csv:parseRecordAsRecordType([{}], {});
[record{}, record{}, record{}, record{}] val10 = check csv:parseListAsRecordType([], [], {});
record{}[2] val11 = check csv:parseListAsRecordType([], [], {});
int[3][2] val12 = check csv:parseListAsListType([], {});

import ballerina/data.csv;
import ballerina/lang.regexp;

type A [[int, string], [int, string]];
public function main() returns error? {
    stream<byte[], error?> s = (<byte[][]> [[1, 2, 3, 4, 5]]).toStream();

    [[int, string], [int, string]] _ = check csv:parseString(string `a,b`, {});
    [record{}, record{}, record{}, record{}] _ = check csv:parseString(string `a,b`, {});
    [[int, string], [int, string]] _ = check csv:parseStream(s, {});
    [record{}, record{}, record{}, record{}] _ = check csv:parseStream(s, {});
    A _ = check csv:parseBytes([1,2,3], {});
    record{}[]|[record{}, record{}, record{}, record{}] _ = check csv:parseBytes([1,2,3], {});
    int[][]|[[int, string], [int, string]] _ = check csv:transform([{}], {});
    [[int, string], [int, string]] _ = check csv:parseList([], {});
    [record{}, record{}, record{}, record{}] _ = check csv:transform([{}], {});
    [record{}, record{}, record{}, record{}] _ = check csv:parseList([], {});
    record{record{} a;}[] _ = check csv:parseList([], {});
    record{int[] a;}[] _ = check csv:parseList([], {});
    record{[int...] a;}[] _ = check csv:parseList([], {});
    record{[int...] a;}[] _ = check csv:parseList([], {});
    record{record{} a;}[] _ = check csv:parseList([], {});
    record{xml a; regexp:RegExp b;}[] _ = check csv:parseList([], {});
    [xml, xml][] _ = check csv:parseList([], {});
    [regexp:RegExp, xml, int[]][] _ = check csv:parseList([], {});
    [regexp:RegExp, xml, int[]][]|int[][] _ = check csv:parseList([], {});
    int[][]|[regexp:RegExp, xml, int[]][] _ = check csv:parseList([], {});
    int[][]|[record{}|regexp:RegExp][] _ = check csv:parseList([], {});
    record{}[]|int[][] _ = check csv:parseList([], {});
    record{}[2] _ = check csv:parseList([], {});
    int[3][2] _ = check csv:parseList([], {});
}

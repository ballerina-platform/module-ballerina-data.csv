// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

type BooleanArray boolean[];
type BooleanArrayArray BooleanArray[];
type NillableIntOrUnionBooleanArray (int|boolean?)[];
type StringArray1 string[];
type StringArray2 string[2];
type JsonArray1 json[];
type AnydataArray1 anydata[];
type BooleanTuple1 [boolean, boolean, boolean, boolean];
type BooleanTuple2 [boolean, boolean];
type BooleanTuple3 [boolean, boolean...];
type BooleanTuple4 [boolean...];
type NillableBooleanTuple5 [boolean?, boolean?, boolean?, boolean?, boolean?];
type NillableBooleanTuple6 [boolean?, boolean?];
type NillableBooleanTuple7 [boolean?, boolean?, boolean?...];
type NillableBooleanTuple8 [boolean?...];
type NillableIntBooleanTuple9 [int|boolean?, int|boolean?...];
type NilTuple3 [(), ()...];
type DecimalTuple3 [decimal, decimal...];
type StringTuple3 [string, string...];
type AnydataTuple3 [anydata, anydata...];
type JsonTuple3 [json, json...];
type DecimalArray1 decimal[];

type NilTuple3Array NilTuple3[];
type DecimalTuple3Array DecimalTuple3[];
type StringTuple3Array StringTuple3[];
type AnydataTuple3Array AnydataTuple3[];
type JsonTuple3Array JsonTuple3[];

type NillableBooleanArray boolean?[];
type NillableBooleanArrayArray NillableBooleanArray[];
type NillableIntOrUnionBooleanArrayArray NillableIntOrUnionBooleanArray[];
type StringArray1Array StringArray1[];
type StringArray2Array StringArray2[];
type JsonArray1Array JsonArray1[];
type AnydataArray1Array AnydataArray1[];

type BooleanTuple1Array BooleanTuple1[];
type BooleanTuple2Array BooleanTuple2[];
type BooleanTuple3Array BooleanTuple3[];
type BooleanTuple4Array BooleanTuple4[];
type NillableBooleanTuple5Array NillableBooleanTuple5[];
type NillableBooleanTuple6Array NillableBooleanTuple6[];
type NillableBooleanTuple7Array NillableBooleanTuple7[];
type NillableBooleanTuple8Array NillableBooleanTuple8[];
type NillableIntBooleanTuple9Array NillableIntBooleanTuple9[];
type DecimalArray1Array DecimalArray1[];

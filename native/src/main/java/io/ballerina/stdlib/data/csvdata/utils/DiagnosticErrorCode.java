/*
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.stdlib.data.csvdata.utils;

/**
 * Represents a diagnostic error code.
 *
 * @since 0.1.0
 */
public enum DiagnosticErrorCode {

    INVALID_TYPE("BDE_0001", "invalid.type"),
    UNION_TYPES_NOT_ALLOWED("BDE_0002", "union.types.not.allowed.as.expected.type"),
    INVALID_ARRAY_MEMBER("BDE_0003", "invalid.array.member.in.expected.type"),
    INVALID_FIELD_IN_CSV("BDE_0004", "cannot.found.field.in.csv"),
    INVALID_CAST("BDE_0005", "csv.value.cannot.cast.into.expected.type"),
    INVALID_EXPECTED_TYPE("BDE_0006", "invalid.expected.type"),
    INVALID_TOKEN("BDE_0007", "invalid.token.while.reading.the.csv.data"),
    INVALID_CSV_DATA_FORMAT("BDE_0008", "invalid.csv.data.format"),
    INVALID_EXPECTED_ARRAY_SIZE("BDE_0009", "invalid.expected.array.size"),
    INVALID_EXPECTED_TUPLE_SIZE("BDE_0010", "invalid.expected.tuple.size"),
    INVALID_SKIP_COLUMN_QUERY("BDE_0011", "invalid.skip.column.query");

    String diagnosticId;
    String messageKey;

    DiagnosticErrorCode(String diagnosticId, String messageKey) {
        this.diagnosticId = diagnosticId;
        this.messageKey = messageKey;
    }

    public String messageKey() {
        return messageKey;
    }
}

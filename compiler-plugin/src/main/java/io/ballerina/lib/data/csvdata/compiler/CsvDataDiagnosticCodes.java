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

package io.ballerina.lib.data.csvdata.compiler;

import io.ballerina.tools.diagnostics.DiagnosticSeverity;

import static io.ballerina.tools.diagnostics.DiagnosticSeverity.ERROR;

/**
 * Diagnostic codes for Csv data's compiler plugin.
 *
 * @since 0.1.0
 */
public enum CsvDataDiagnosticCodes {
    DUPLICATE_FIELD("CSV_ERROR_1", "invalid field: duplicate field found", ERROR),
    UNSUPPORTED_TYPE("CSV_ERROR_2", "unsupported type: type is not supported", ERROR),
    UNSUPPORTED_FIELD_TYPE("CSV_ERROR_3", "Unsupported type in the field: Only basic types are supported for fields, " +
                              "and other types are not allowed.", ERROR),
    UNSUPPORTED_TUPLE_MEMBER_TYPE("CSV_ERROR_4", "Unsupported type in the tuple member: Tuple members can only " +
                                          "be basic types, other types are not supported.", ERROR),
    IGNORE_OUTPUT_HEADERS_FOR_RECORD_ARRAY("CSV_ERROR_5", "The option 'outputWithHeaders' will be ignored since the " +
                                "expected type is a subtype record array.", ERROR),
    IGNORE_HEADERS_ORDER_FOR_RECORD_ARRAY("CSV_ERROR_5", "The option 'headersOrder' will be ignored " +
            "since the expected type is a subtype record array.", ERROR),
    IGNORE_CUSTOM_HEADERS_PARAMETER_WHEN_HEADER_PRESENT("CSV_ERROR_6",
            "The option 'customHeadersIfHeadersAbsent' will be ignored since the header is present.", ERROR),
    CUSTOM_HEADERS_SHOULD_BE_PROVIDED("CSV_ERROR_7",
            "customHeaders parameter should be provided since the headerRows larger than 1.", ERROR);

    private final String code;
    private final String message;
    private final DiagnosticSeverity severity;

    CsvDataDiagnosticCodes(String code, String message, DiagnosticSeverity severity) {
        this.code = code;
        this.message = message;
        this.severity = severity;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public DiagnosticSeverity getSeverity() {
        return severity;
    }
}

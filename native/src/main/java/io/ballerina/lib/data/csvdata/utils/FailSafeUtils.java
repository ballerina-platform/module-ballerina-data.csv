/*
 * Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
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

package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.concurrent.StrandMetadata;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.Instant;
import java.util.concurrent.atomic.AtomicBoolean;

import static io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode.HEADER_CANNOT_BE_EMPTY;
import static io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode.INVALID_CSV_DATA_FORMAT;
import static io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode.INVALID_FIELD_IN_CSV;
import static io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode.NO_FIELD_FOR_HEADER;
import static org.ballerinalang.langlib.value.ToJson.toJson;

/**
 * Utility class for fail-safe error handling and logging in CSV operations.
 *
 * @since 0.1.0
 */
public final class FailSafeUtils {

    public static final String PRINT_ERROR = "printError";
    public static final BString FILE_PATH = StringUtils.fromString("filePath");
    public static final String OVERWRITE = "OVERWRITE";
    public static final BString FILE_OUTPUT_MODE = StringUtils.fromString("fileOutputMode");
    public static final BString FILE_WRITE_OPTION = StringUtils.fromString("fileWriteOption");
    public static final String MISSING_FILE_PATH_ERROR =
            "The `outputMode` is set to FILE, but no `filePath` was provided.";
    public static final String FILE_IO_ERROR = "Failed to create log file at: %s. Caused by: %s%n";
    public static final String FILE_OVERWRITE_ERROR = "Failed to overwrite log file at: %s. Caused by: %s";
    public static final String FILE_WRITE_ERROR = "Failed to write log file at: %s. Caused by: %s";
    public static final String CSV_PARSE_ERROR = "CSV parse error at row %d, column %d: %s";
    public static final BString CONTENT_TYPE = StringUtils.fromString("contentType");
    public static final String RAW = "RAW";
    public static final String METADATA = "METADATA";
    public static final BString ENABLE_CONSOLE_LOGS = StringUtils.fromString("enableConsoleLogs");
    public static final BString OFFENDING_ROW = StringUtils.fromString("offendingRow");
    public static final BString EXCLUDE_SOURCE_DATA_IN_CONSOLE =
            StringUtils.fromString("excludeSourceDataInConsole");

    private FailSafeUtils() {
    }

    public static boolean isAllowedFailSafe(Exception exception) {
        if (!(exception instanceof BError bError)) {
            return true;
        }
        String message = bError.getMessage();
        if (message == null) {
            return true;
        }
        return !matchesErrorMessage(message, INVALID_CSV_DATA_FORMAT)
                && !matchesErrorMessage(message, INVALID_FIELD_IN_CSV)
                && !matchesErrorMessage(message, NO_FIELD_FOR_HEADER)
                && !matchesErrorMessage(message, HEADER_CANNOT_BE_EMPTY);
    }

    private static boolean matchesErrorMessage(String message, DiagnosticErrorCode errorCode) {
        String expectedMessage = DiagnosticLog.getErrorMessage(errorCode);
        String baseMessage = expectedMessage.replaceAll("\\{\\d+\\}", "").trim();
        return message.contains(baseMessage);
    }

    public static void handleFailSafeLogging(Environment environment, BMap<?, ?> failSafe, Exception exception,
                                             String offendingRow, int rowIndex, int columnIndex,
                                             AtomicBoolean isOverwritten, boolean enableConsoleLogs,
                                             boolean excludeSourceDataInConsole) {
        if (enableConsoleLogs && environment != null) {
            processConsoleLogs(environment, exception, excludeSourceDataInConsole, offendingRow,
                    rowIndex, columnIndex);
        }
        BMap<?, ?> fileOutputMode = failSafe.getMapValue(FILE_OUTPUT_MODE);
        if (fileOutputMode != null) {
            processErrorLogsInFiles(exception, fileOutputMode, offendingRow, rowIndex, columnIndex, isOverwritten);
        }
    }

    public static void processConsoleLogs(Environment environment, Exception exception,
                                          boolean excludeSourceData, String offendingRow,
                                          int rowIndex, int columnIndex) {
        BMap<BString, Object> keyValues = ValueCreator.createMapValue();
        if (!excludeSourceData) {
            keyValues.put(OFFENDING_ROW, StringUtils.fromString(offendingRow.trim()));
        }
        printErrorLogs(environment, exception, keyValues, rowIndex, columnIndex);
    }

    public static void printErrorLogs(Environment environment, Exception exception,
                                      BMap<BString, Object> keyValues, int rowIndex, int columnIndex) {
        StrandMetadata strandMetadata = new StrandMetadata(true,
                ModuleUtils.getProperties(PRINT_ERROR));
        String errorMessage = String.format(CSV_PARSE_ERROR, rowIndex + 1, columnIndex + 1, exception.getMessage());
        Object[] arguments = new Object[]{StringUtils.fromString(errorMessage), null, null, keyValues};
        environment.getRuntime().callFunction(ModuleUtils.getModule(), PRINT_ERROR, strandMetadata, arguments);
    }

    public static void processErrorLogsInFiles(Exception exception, BMap<?, ?> outputMode,
                                               String offendingRow, int rowIndex, int columnIndex,
                                               AtomicBoolean isOverwritten) {
        String dataType = outputMode.getStringValue(CONTENT_TYPE).toString();
        handleFileOutputLogging(outputMode, exception, offendingRow, dataType, rowIndex, columnIndex, isOverwritten);
    }

    public static void handleFileOutputLogging(BMap<?, ?> logFileConfig, Exception exception,
                                               String rawData, String dataType,
                                               int rowIndex, int columnIndex,
                                               AtomicBoolean isOverwritten) {
        BString filePathValue = logFileConfig.getStringValue(FILE_PATH);
        String filePath = filePathValue != null ? filePathValue.toString() : null;
        handleLogFileGeneration(filePath);
        String fileWriteOption = logFileConfig.getStringValue(FILE_WRITE_OPTION).toString();
        if (OVERWRITE.equals(fileWriteOption) && !isOverwritten.get()) {
            overwriteLogFile(filePath);
            isOverwritten.set(true);
        }
        if (dataType.equals(RAW)) {
            writeLogsToFile(filePath, rawData + System.lineSeparator());
        } else {
            boolean excludeSourceData = dataType.equals(METADATA);
            String jsonLog = buildJsonLog(exception, rawData, excludeSourceData, rowIndex, columnIndex);
            writeLogsToFile(filePath, jsonLog + System.lineSeparator());
        }
    }

    public static void handleLogFileGeneration(String filePath) {
        try {
            Path path = Paths.get(filePath);
            Path parentDir = path.getParent();
            if (parentDir != null) {
                Files.createDirectories(parentDir);
            }
            if (Files.notExists(path)) {
                Files.createFile(path);
            }
        } catch (IOException ioException) {
            throw DiagnosticLog.error(DiagnosticErrorCode.FAILED_FILE_IO_OPERATION,
                    String.format(FILE_IO_ERROR, filePath, ioException.getMessage()));
        }
    }

    public static void overwriteLogFile(String filePath) {
        Path path = Paths.get(filePath);
        try {
            Files.write(path, new byte[0], StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
        } catch (IOException exception) {
            throw DiagnosticLog.error(DiagnosticErrorCode.FAILED_FILE_IO_OPERATION,
                    String.format(FILE_OVERWRITE_ERROR, filePath, exception.getMessage()));
        }
    }

    public static void writeLogsToFile(String filePath, String content) {
        Path path = Paths.get(filePath);
        try {
            Files.writeString(path, content.trim() + System.lineSeparator(), StandardOpenOption.CREATE,
                    StandardOpenOption.WRITE, StandardOpenOption.APPEND);
        } catch (IOException exception) {
            throw DiagnosticLog.error(DiagnosticErrorCode.FAILED_FILE_IO_OPERATION,
                    String.format(FILE_WRITE_ERROR, filePath, exception.getMessage()));
        }
    }

    public static String buildJsonLog(Exception exception, String sourceData, boolean excludeSourceData,
                                      int rowIndex, int columnIndex) {
        String time = Instant.now().toString();
        String message = exception.getMessage();
        StringBuilder json = new StringBuilder();
        json.append("{\"time\":\"").append(StringUtils.fromString(time)).append("\",");
        json.append("\"location\":{\"row\":").append(rowIndex + 1);
        json.append(",\"column\":").append(columnIndex + 1).append("},");
        if (!excludeSourceData) {
            json.append("\"offendingRow\":\"").append(StringUtils.fromString(sourceData.trim())).append("\",");
        }
        json.append("\"message\":\"").append(StringUtils.fromString(message)).append("\"}");
        return toJson(StringUtils.fromString(json.toString())).toString();
    }
}


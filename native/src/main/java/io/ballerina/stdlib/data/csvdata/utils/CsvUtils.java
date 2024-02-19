package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.stdlib.data.csvdata.csv.CsvConfig;

public class CsvUtils {
    public static CsvConfig createFromCsvConfiguration(BMap<BString, Object> config) {
        return CsvConfig.createFromCsvConfiguration(config);
    }

    public static CsvConfig createToCsvConfiguration(BMap<BString, Object> config) {
        return CsvConfig.createToCsvConfiguration(config);
    }

    public static void validateExpectedArraySize(int size, int currentSize) {
        if (size != -1 && size > currentSize) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
        }
    }
}

package io.ballerina.stdlib.data.csvdata.csv;

import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

import java.util.ArrayList;

import static io.ballerina.stdlib.data.csvdata.utils.Constants.ConfigConstants.*;

public class CsvConfig {
    long startNumber = 0;
    long headerStartNumber = 0;
    long dataStartNumber = 1;
    boolean headers = true;
    char escapeCharacter = '\\';
    boolean ignoreEmptyLines = true;
    char separator = ',';
    String quote = "\"";
    boolean skipHeaders = false;
    long skipDataRows = 0;
    long dataRowCount = -1;
    Object orderBy = new ArrayList<>();
    Object skipColumns = null;
    Object customHeader = null;
    boolean suppressEscaping = false;
    Object nullValue = null;
    Object root = null;
    char lineSeparator = '\n';


    private CsvConfig(boolean headers, char escapeCharacter, boolean ignoreEmptyLines,
                     char separator, boolean skipHeaders, long skipDataRows,
                     long dataRowCount, Object orderBy, Object skipColumns, Object customHeader,
                     boolean suppressEscaping, Object nullValue, char lineSeparator) {
        this.headers = headers;
        this.escapeCharacter = escapeCharacter;
        this.separator = separator;
        this.skipHeaders = skipHeaders;
        this.skipDataRows = skipDataRows;
        this.dataRowCount = dataRowCount;
        this.orderBy = orderBy;
        this.skipColumns = skipColumns;
        this.customHeader = customHeader;
        this.suppressEscaping = suppressEscaping;
        this.nullValue = nullValue;
        this.lineSeparator = lineSeparator;
    }

    private CsvConfig(long startNumber, long headerStartNumber, long dataStartNumber,
                     boolean headers, char escapeCharacter, boolean ignoreEmptyLines,
                     char separator, String quote, boolean skipHeaders, long skipDataRows,
                     long dataRowCount, Object orderBy, Object skipColumns, Object customHeader,
                     boolean suppressEscaping, Object nullValue, Object root) {
        this.startNumber = startNumber;
        this.headerStartNumber = headerStartNumber;
        this.dataStartNumber = dataStartNumber;
        this.headers = headers;
        this.escapeCharacter = escapeCharacter;
        this.ignoreEmptyLines = ignoreEmptyLines;
        this.separator = separator;
        this.quote = quote;
        this.skipHeaders = skipHeaders;
        this.skipDataRows = skipDataRows;
        this.dataRowCount = dataRowCount;
        this.orderBy = orderBy;
        this.skipColumns = skipColumns;
        this.customHeader = customHeader;
        this.suppressEscaping = suppressEscaping;
        this.nullValue = nullValue;
        this.root = root;
    }

    public CsvConfig() {
    }

    public static CsvConfig createFromCsvConfiguration(BMap<BString, Object> config) {
        return new CsvConfig(
            config.getIntValue(START_NUMBER), config.getIntValue(HEADER_START_NUMBER),
            config.getIntValue(DATA_START_NUMBER), config.getBooleanValue(HEADERS),
            // TODO: Handle unicodes
            config.getStringValue(ESCAPE_CHARACTER).toString().charAt(0), config.getBooleanValue(IGNORE_EMPTY_LINES),
            config.getStringValue(SEPARATOR).toString().charAt(0), config.getStringValue(QUOTE).toString(),
            config.getBooleanValue(SKIP_HEADERS), config.getIntValue(SKIP_DATA_ROWS),
            config.getIntValue(DATA_ROW_COUNT), config.get(ORDER_BY), config.get(SKIP_COLUMNS),
            config.get(CUSTOM_HEADER), config.getBooleanValue(SUPPRESS_ESCAPING),
            config.get(NULL_VALUE), config.get(ROOT)
        );
    }

    public static CsvConfig createToCsvConfiguration(BMap<BString, Object> config) {
        return new CsvConfig(
            config.getBooleanValue(HEADERS), config.getStringValue(ESCAPE_CHARACTER).toString().charAt(0),
            config.getBooleanValue(IGNORE_EMPTY_LINES), config.getStringValue(SEPARATOR).toString().charAt(0),
            config.getBooleanValue(SKIP_HEADERS), config.getIntValue(SKIP_DATA_ROWS),
            config.getIntValue(DATA_ROW_COUNT), config.get(ORDER_BY),
            config.get(SKIP_COLUMNS), config.get(CUSTOM_HEADER),
            config.getBooleanValue(SUPPRESS_ESCAPING), config.get(NULL_VALUE),
            config.getStringValue(LINE_SEPARATOR).toString().charAt(0)
        );
    }
}

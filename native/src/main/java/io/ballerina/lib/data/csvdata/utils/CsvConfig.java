package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

/*
 * Configuration for CSV operations.
 *
 * @since 0.1.0
 */
public class CsvConfig {
    public char delimiter = ',';
    public char textEnclosure = '\\';
    public Object header = 0;
    public char escapeChar = '\\';
    public Object lineTerminator = '\n';
    public Object skipLines = null;
    public Object nilValue = null;
    public char comment = '#';
    public String locale = "en_US";
    public boolean nilAsOptionalField = false;
    public boolean absentAsNilableType = false;
    public boolean allowDataProjection = true;
    public Object headerOrder = null;
    public boolean stringConversion = false;
    public boolean enableConstraintValidation = false;
    public boolean outputWithHeaders = false;
    public Object customHeadersIfHeadersAbsent = null;
    public long headerRows = 0;
    public Object customHeaders = null;
    public boolean failSafe = true;

    private CsvConfig(CsvConfig config) {
        this.allowDataProjection = false;
        this.header = config.header;
        this.delimiter = config.delimiter;
        this.textEnclosure = config.textEnclosure;
        this.escapeChar = config.escapeChar;
        this.lineTerminator = config.lineTerminator;
        this.nilValue = config.nilValue;
        this.comment = config.comment;
        this.locale = config.locale;
        this.failSafe = config.failSafe;
    }

    public static CsvConfig createParseListOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION),
                options.getBooleanValue(Constants.ConfigConstants.OUTPUT_WITH_HEADERS),
                options.getIntValue(Constants.ConfigConstants.HEADER_ROWS),
                options.get(Constants.ConfigConstants.CUSTOM_HEADERS),
                options.getBooleanValue(Constants.ConfigConstants.FAIL_SAFE)
        );
    }

    public CsvConfig(boolean nilAsOptionalField, boolean absentAsNilableType, boolean allowDataProjection,
                     Object skipLines, boolean enableConstraintValidation, boolean outputWithHeaders,
                     long headerRows, Object headers, boolean failSafe) {
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
        this.enableConstraintValidation = enableConstraintValidation;
        this.outputWithHeaders = outputWithHeaders;
        this.headerRows = headerRows;
        this.customHeaders = headers;
        this.failSafe = failSafe;
    }

    public static CsvConfig createTransformOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION),
                options.getBooleanValue(Constants.ConfigConstants.OUTPUT_WITH_HEADERS),
                options.get(Constants.ConfigConstants.HEADERS_ORDER),
                options.getBooleanValue(Constants.ConfigConstants.FAIL_SAFE)
        );
    }

    public CsvConfig(boolean nilAsOptionalField, boolean absentAsNilableType, boolean allowDataProjection,
                     Object skipLines, boolean enableConstraintValidation, boolean outputWithHeaders,
                     Object headerOrder, boolean failSafe) {
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
        this.enableConstraintValidation = enableConstraintValidation;
        this.outputWithHeaders = outputWithHeaders;
        this.headerOrder = headerOrder;
        this.failSafe = failSafe;
    }

    public static CsvConfig createParseOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION),
                options.getBooleanValue(Constants.ConfigConstants.OUTPUT_WITH_HEADERS),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.DELIMITER)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.LOCALE)),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.TEXT_ENCLOSURE)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.ESCAPE_CHAR)).charAt(0),
                options.get(Constants.ConfigConstants.LINE_TERMINATOR),
                options.get(Constants.ConfigConstants.NIL_VALUE),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.COMMENT_CHAR)).charAt(0),
                options.get(Constants.ConfigConstants.HEADER),
                options.get(Constants.ConfigConstants.CUSTOM_HEADERS_IF_HEADER_ABSENT),
                options.getBooleanValue(Constants.ConfigConstants.FAIL_SAFE)
        );
    }

    public CsvConfig(boolean nilAsOptionalField, boolean absentAsNilableType, boolean allowDataProjection,
                     Object skipLines, boolean enableConstraintValidation, boolean outputWithHeaders, char delimiter,
                     String locale, char textEnclosure, char escapeChar, Object lineTerminator,
                     Object nilValue, char comment, Object header,
                     Object customHeadersIfHeadersAbsent, boolean failSafe) {
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
        this.enableConstraintValidation = enableConstraintValidation;
        this.outputWithHeaders = outputWithHeaders;
        this.delimiter = delimiter;
        this.locale = locale;
        this.textEnclosure = textEnclosure;
        this.escapeChar = escapeChar;
        this.lineTerminator = lineTerminator;
        this.nilValue = nilValue;
        this.comment = comment;
        this.header = header;
        this.customHeadersIfHeadersAbsent = customHeadersIfHeadersAbsent;
        this.failSafe = failSafe;
    }

    public static CsvConfig createConfigOptionsForUnion(CsvConfig config) {
        return new CsvConfig(config);
    }

    private static void updateDataProjectOptions(BMap<BString, Object> options) {
        Object allowProjections = options.get(Constants.ConfigConstants.ALLOW_DATA_PROJECTION);
        if (allowProjections instanceof Boolean) {
            options.put(Constants.ConfigConstants.NIL_AS_OPTIONAL, false);
            options.put(Constants.ConfigConstants.ABSENT_AS_NILABLE, false);
            return;
        }
        BMap<BString, Object> projections = (BMap<BString, Object>) allowProjections;
        options.put(Constants.ConfigConstants.ALLOW_DATA_PROJECTION, true);
        options.put(Constants.ConfigConstants.NIL_AS_OPTIONAL, projections.getBooleanValue(
                Constants.ConfigConstants.NIL_AS_OPTIONAL));
        options.put(Constants.ConfigConstants.ABSENT_AS_NILABLE, projections.getBooleanValue(
                Constants.ConfigConstants.ABSENT_AS_NILABLE));
    }
}

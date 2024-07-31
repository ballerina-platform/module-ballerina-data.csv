package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

public class CsvConfig {
    public char delimiter = ',';
    public char textEnclosure = '\\';
    public Object header = (long) 0;
    public char escapeChar = '\\';
    public Object lineTerminator = '\n';
    public Object skipLines = null;
    public Object nilValue = null;
    public char comment = '#';
    public String locale = "en_US";
    public boolean nilAsOptionalField = false;
    public boolean absentAsNilableType = false;
    public boolean allowDataProjection = true;
    public Object customHeader = null;
    public BArray headersOrder = null;
    public boolean stringConversion = false;
    public boolean enableConstraintValidation = false;

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
    }

    private CsvConfig(boolean enableConstraintValidation, Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection, Object customHeader) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.customHeader = customHeader;
    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection, boolean stringConversion) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.stringConversion = stringConversion;
    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField, boolean absentAsNilableType,
                      boolean allowDataProjection, boolean stringConversion, Object customHeader,
                      boolean enableConstraintValidation) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.stringConversion = stringConversion;
        this.customHeader = customHeader;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    public static CsvConfig createListTypeOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
            options.get(Constants.ConfigConstants.SKIP_LINES),
            options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL).booleanValue(),
            options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE).booleanValue(),
            options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION).booleanValue(),
            options.getBooleanValue(Constants.ConfigConstants.STRING_CONVERSION).booleanValue()
        );
    }

    public static CsvConfig createListAsRecordTypeOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL).booleanValue(),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE).booleanValue(),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION).booleanValue(),
                options.getBooleanValue(Constants.ConfigConstants.STRING_CONVERSION).booleanValue(),
                options.get(Constants.ConfigConstants.CUSTOM_HEADERS),
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION).booleanValue()
        );
    }

    private CsvConfig(char delimiter, char textEnclosure, Object header,
                      char escapeChar, Object lineTerminator, Object skipLines,
                      Object nilValue, char comment, String locale,
                      boolean nilAsOptionalField, boolean absentAsNilableType, boolean allowDataProjection) {
        this.delimiter = delimiter;
        this.textEnclosure = textEnclosure;
        this.header = header;
        this.escapeChar = escapeChar;
        this.lineTerminator = lineTerminator;
        this.nilValue = nilValue == null ? null : nilValue;
        this.comment = comment;
        this.locale = locale;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
    }

    private CsvConfig(char delimiter, char textEnclosure, Object header, char escapeChar, Object lineTerminator,
                      Object skipLines, Object nilValue, char comment, String locale,
                      boolean nilAsOptionalField, boolean absentAsNilableType,
                      boolean allowDataProjection, Object customHeaders, boolean enableConstraintValidation) {
        this.delimiter = delimiter;
        this.textEnclosure = textEnclosure;
        this.header = header;
        this.escapeChar = escapeChar;
        this.lineTerminator = lineTerminator;
        this.nilValue = nilValue == null ? null : nilValue;
        this.comment = comment;
        this.locale = locale;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
        this.customHeader = customHeaders;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    public static CsvConfig createRecordAsRecordOption(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION)
        );
    }

    public static CsvConfig createParseOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.DELIMITER)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.TEXT_ENCLOSURE)).charAt(0),
                options.get(Constants.ConfigConstants.HEADER),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.ESCAPE_CHAR)).charAt(0),
                options.get(Constants.ConfigConstants.LINE_TERMINATOR),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.get(Constants.ConfigConstants.NIL_VALUE),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.COMMENT_CHAR)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.LOCALE)),
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION)
        );
    }

    public static CsvConfig createParserToRecordOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.DELIMITER)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.TEXT_ENCLOSURE)).charAt(0),
                options.get(Constants.ConfigConstants.HEADER),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.ESCAPE_CHAR)).charAt(0),
                options.get(Constants.ConfigConstants.LINE_TERMINATOR),
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getStringValue(Constants.ConfigConstants.NIL_VALUE),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.COMMENT_CHAR)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(Constants.ConfigConstants.LOCALE)),
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION),
                options.get(Constants.ConfigConstants.CUSTOM_HEADERS),
                options.getBooleanValue(Constants.ConfigConstants.ENABLE_CONSTRAINT_VALIDATION)
        );
    }

    public static CsvConfig createToRecordOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.get(Constants.ConfigConstants.SKIP_LINES),
                options.getBooleanValue(Constants.ConfigConstants.NIL_AS_OPTIONAL),
                options.getBooleanValue(Constants.ConfigConstants.ABSENT_AS_NILABLE),
                options.getBooleanValue(Constants.ConfigConstants.ALLOW_DATA_PROJECTION),
                options.get(Constants.ConfigConstants.CUSTOM_HEADERS)
        );
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

package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.*;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.ValueUtils;
import io.ballerina.runtime.api.values.*;
import io.ballerina.stdlib.data.csvdata.FromString;
import io.ballerina.stdlib.data.csvdata.csv.CsvCreator;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;

import static io.ballerina.runtime.api.TypeTags.INT_TAG;
import static io.ballerina.stdlib.data.csvdata.utils.Constants.SKIP_LINE_RANGE_SEP;

public class CsvUtils {
    public static void validateExpectedArraySize(int size, int currentSize) {
        if (size != -1 && size > currentSize) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
        }
    }

    public static boolean isBasicType(Type type) {
        switch (type.getTag()) {
            case TypeTags.INT_TAG:
            case TypeTags.STRING_TAG:
            case TypeTags.BOOLEAN_TAG:
            case TypeTags.DECIMAL_TAG:
            case TypeTags.FLOAT_TAG:
            case TypeTags.NULL_TAG:
            case TypeTags.JSON_TAG:
            case TypeTags.ANYDATA_TAG:
            case TypeTags.UNION_TAG:
            case TypeTags.INTERSECTION_TAG:
                return true;
            default:
                return false;
        }
    }

    public static String[] createHeaders(String[] headers, CsvConfig config) {
        Object customHeaders = config.customHeader;

        if (customHeaders == null) {
            for (int i = 0; i < headers.length; i++) {
                headers[i] = String.valueOf( i + 1);
            }
        }

        if (customHeaders instanceof BArray) {
            BArray array = (BArray) customHeaders;
            if (array.size() != headers.length) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
            }
            for (int i = 0; i < headers.length; i++) {
                headers[i] = array.get(i).toString();
            }
        }

        return headers;
    }

    public static Optional<Type> getMutableType(IntersectionType intersectionType) {
        for (Type constituentType : intersectionType.getConstituentTypes()) {
            if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                continue;
            }
            return Optional.of(constituentType);
        }
        return Optional.empty();
    }

    public static Object convertToBasicType(Object csv, Type targetType, CsvConfig config) {
        if (csv == null) {
            csv = config.nilValue;
        }
        return ValueUtils.convert(csv, targetType);
    }

    public static void checkRequiredFieldsAndLogError(Map<String, Field> filedHierarchy, boolean absentAsNilableType) {
        filedHierarchy.values().forEach(field -> {
            if (absentAsNilableType && field.getFieldType().isNilable()) {
                return;
            }
            if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
            }
        });
    }

    public static boolean isHeaderFieldsEmpty(Map<String, Field> currentField) {
        for (Field field: currentField.values()) {
            if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                return false;
            }
        }
        return true;
    }

    public static boolean checkTypeCompatibility(Type constraintType, Object csv, boolean stringConversion) {
        int tag = constraintType.getTag();
        if ((csv instanceof BString && (stringConversion || tag == TypeTags.STRING_TAG
                        || tag == TypeTags.CHAR_STRING_TAG || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof Long && (tag == INT_TAG
                    || tag == TypeTags.FLOAT_TAG || tag == TypeTags.DECIMAL_TAG || tag == TypeTags.BYTE_TAG
                    || tag == TypeTags.SIGNED8_INT_TAG || tag == TypeTags.SIGNED16_INT_TAG
                    || tag == TypeTags.SIGNED32_INT_TAG || tag == TypeTags.UNSIGNED8_INT_TAG
                    || tag == TypeTags.UNSIGNED16_INT_TAG || tag == TypeTags.UNSIGNED32_INT_TAG
                    || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof BDecimal && ((tag == TypeTags.DECIMAL_TAG
                        || tag == TypeTags.FLOAT_TAG || tag == INT_TAG) || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof Double && ((tag == TypeTags.FLOAT_TAG
                        || tag == TypeTags.DECIMAL_TAG || tag == INT_TAG) || isJsonOrAnyDataOrAny(tag)))
                || (Boolean.class.isInstance(csv) && (tag == TypeTags.BOOLEAN_TAG || isJsonOrAnyDataOrAny(tag)))
                || (csv == null && (tag == TypeTags.NULL_TAG || isJsonOrAnyDataOrAny(tag)))) {
            return true;
        } else {
            return false;
        }
    }

    private static boolean isJsonOrAnyDataOrAny(int tag) {
        return tag == TypeTags.JSON_TAG || tag == TypeTags.ANYDATA_TAG || tag == TypeTags.ANY_TAG;
    }

    public static int getTheActualExpectedType(Type type) {
        if (type instanceof TupleType) {
            TupleType tupleType = (TupleType) type;
            if (tupleType.getRestType() != null) {
                return -1;
            }
            return tupleType.getTupleTypes().size();
        } else {
            return ((ArrayType) type).getSize();
        }
    }

    public static HashMap<String, String> processNameAnnotationsAndBuildCustomFieldMap(RecordType recordType,
                                                                                       Map<String, Field> fieldHierarchy) {
        BMap<BString, Object> annotations = recordType.getAnnotations();
        HashMap<String, String> updatedRecordFieldNames = new HashMap<>();
        HashSet<String> updatedFields = new HashSet<>();
        HashSet<String> updatedValues = new HashSet<>();

        for (BString annotationsKey : annotations.getKeys()) {
            String key = annotationsKey.getValue();
            if (key.contains(Constants.FIELD)) {
                BMap<BString, Object> annotMap = ((BMap<BString, Object>) annotations.get(annotationsKey));
                for (BString mapKey : annotMap.getKeys()) {
                    if (mapKey.getValue().endsWith(Constants.NAME)) {
                        String name = ((Map<BString, Object>) annotMap.get(mapKey)).get(Constants.VALUE).toString();
                        String originalName = key.substring(Constants.FIELD.length());
                        if (updatedValues.contains(name)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, name);
                        }
                        if (updatedFields.contains(originalName)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, originalName);
                        }
                        updatedFields.add(originalName);
                        updatedValues.add(name);
                        updatedRecordFieldNames.put(name, originalName);
                        break;
                    }
                }
            }
        }
        for (String field : fieldHierarchy.keySet()) {
            if (updatedFields.contains(field)) {
                continue;
            }
            if (updatedValues.contains(field) || updatedRecordFieldNames.containsKey(field)) {
                throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, field);
            }
            updatedRecordFieldNames.put(field, field);
        }

        return updatedRecordFieldNames;
    }

    public static String getUpdatedHeaders(Map<String, String> updatedRecords, String key, boolean isKeyContains) {
        String fieldName = updatedRecords.get(key);
        if (fieldName != null) {
            return fieldName;
        }
        if (isKeyContains) {
            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, key);
        }
        return key;
    }

    public static long[] getSkipLinesFromStringConfigValue(String configValue) {
        String[] parts = configValue.split(SKIP_LINE_RANGE_SEP);
        if (parts.length != 2) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_RANGE_FOR_SKIPLINES);
        }
        try {
            int start = Integer.parseInt(parts[0]);
            int end = Integer.parseInt(parts[1]);
            int size = end - start + 1;
            if (size <= 0) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_RANGE_FOR_SKIPLINES);
            }
            long[] result = new long[size];
            for (int i = 0; i < size; i++) {
                result[i] = start + i;
            }
            return result;
        } catch (NumberFormatException e) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_VALUE_FOR_SKIPLINES);
        }
    }

    public static long[] getSkipDataRows(Object skipLines) {
        long[] skipDataRows;
        if (skipLines == null) {
            return new long[]{};
        }
        if (skipLines instanceof BArray) {
            BArray skipLinesArray = (BArray) skipLines;
            if (skipLinesArray.getLength() == 0) {
                return new long[]{};
            }
            skipDataRows = (skipLinesArray).getIntArray();
            return skipDataRows;
        }

        skipDataRows = getSkipLinesFromStringConfigValue(StringUtils.getStringValue(skipLines));
        return skipDataRows;
    }

    public static boolean isNullValue(Object nullValue, Object value) {
        if (value == null) {
            return true;
        }
        if (value instanceof BString) {
            value = StringUtils.getStringValue(value);
        }
        if (value instanceof String v) {
            if ((nullValue == null) && (Constants.Values.NULL.equalsIgnoreCase(v)
                    || Constants.Values.BALLERINA_NULL.equalsIgnoreCase(v))) {
                return true;
            }
            if (nullValue != null && value.equals(StringUtils.getStringValue(nullValue))) {
                return true;
            }
            return false;
        }
        return false;
    }

    public static boolean isCharContainsInLineTerminatorUserConfig(char c, Object lineTerminatorObj) {
        String stringValue = Character.toString(c);
        if (lineTerminatorObj instanceof BArray) {
            Object[] lineTerminators = ((BArray) lineTerminatorObj).getValues();
            for (Object lineTerminator: lineTerminators) {
                if (lineTerminator != null && lineTerminator.toString().equals(stringValue)) {
                    return true;
                }
            }
            return false;
        }

        String lineTerminator = StringUtils.getStringValue(StringUtils.fromString(lineTerminatorObj.toString()));
        return lineTerminator.equals(stringValue);
    }

    public static class SortConfigurations {
        protected Object columnName;
        protected Object sortOrder;

        public SortConfigurations(Object columnName, Object sortOrder) {
            this.columnName = columnName;
            this.sortOrder = sortOrder;
        }
    }

    public static class UnMappedValue {
        private static UnMappedValue value = null;
        public static UnMappedValue createUnMappedValue() {
            if (value == null) {
                value = new UnMappedValue();
            }
            return value;
        }
    }

    public static class SkipMappedValue {
        private static SkipMappedValue value = null;
        public static SkipMappedValue createSkippedValue() {
            if (value == null) {
                value = new SkipMappedValue();
            }
            return value;
        }
    }
}

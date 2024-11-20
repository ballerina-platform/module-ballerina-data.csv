package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.IntersectionType;
import io.ballerina.runtime.api.types.RecordType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.types.TypeTags;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.utils.ValueUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BDecimal;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import static io.ballerina.lib.data.csvdata.utils.Constants.SKIP_LINE_RANGE_SEP;

/*
 * Utility functions used in the CSV data module.
 * 
 * @since 0.1.0
 */
public class CsvUtils {
    private static final long[] EMPTY_LONG_ARRAY =  new long[]{};

    public static void validateExpectedArraySize(int size, int currentSize) {
        if (size != -1 && size > currentSize) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
        }
    }

    public static boolean isExpectedTypeIsArray(Type expectedType) {
        expectedType = TypeUtils.getReferredType(expectedType);

        return switch (expectedType.getTag()) {
            case TypeTags.TUPLE_TAG, TypeTags.ARRAY_TAG -> true;
            default -> false;
        };
    }

    public static boolean isBasicType(Type type) {
        return switch (type.getTag()) {
            case TypeTags.INT_TAG, TypeTags.STRING_TAG, TypeTags.BOOLEAN_TAG, TypeTags.DECIMAL_TAG, TypeTags.FLOAT_TAG,
                 TypeTags.NULL_TAG, TypeTags.JSON_TAG, TypeTags.ANYDATA_TAG, TypeTags.UNION_TAG,
                 TypeTags.INTERSECTION_TAG, TypeTags.CHAR_STRING_TAG, TypeTags.BYTE_TAG, TypeTags.SIGNED8_INT_TAG,
                 TypeTags.SIGNED16_INT_TAG, TypeTags.SIGNED32_INT_TAG, TypeTags.UNSIGNED8_INT_TAG,
                 TypeTags.UNSIGNED16_INT_TAG, TypeTags.UNSIGNED32_INT_TAG -> true;
            default -> false;
        };
    }

    public static String[] createHeadersForParseLists(BArray csvElement, int headerSize, CsvConfig config) {
        String[] headers = new String[headerSize];
        Object customHeaders = config.customHeaders;
        long headerRows = config.headerRows;

        int length = headers.length;
        if (customHeaders instanceof BArray array) {
            if (array.size() != length) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
            }
            for (int i = 0; i < length; i++) {
                headers[i] = array.get(i).toString();
            }
            return headers;
        }

        if (headerRows == 1) {
            return csvElement.getStringArray();
        }

        if (headerRows > 1) {
            throw DiagnosticLog.error(DiagnosticErrorCode.NO_CUSTOM_HEADER_PROVIDED);
        }

        // when headerRows = 0 and customHeaders = null
        for (int i = 0; i < length; i++) {
            headers[i] = String.valueOf(i + 1);
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
        if (csv instanceof BString) {
            return stringConversion || TypeTags.isStringTypeTag(tag) || isJsonOrAnyDataOrAny(tag);
        }
        if (csv instanceof Long) {
            return TypeTags.isIntegerTypeTag(tag) || tag == TypeTags.FLOAT_TAG || tag == TypeTags.DECIMAL_TAG
                    || tag == TypeTags.BYTE_TAG || isJsonOrAnyDataOrAny(tag);
        }
        if (csv instanceof BDecimal) {
            if ((tag == TypeTags.DECIMAL_TAG
                    || tag == TypeTags.FLOAT_TAG || TypeTags.isIntegerTypeTag(tag)) || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv instanceof Double) {
            return (tag == TypeTags.FLOAT_TAG
                    || tag == TypeTags.DECIMAL_TAG || TypeTags.isIntegerTypeTag(tag)) || isJsonOrAnyDataOrAny(tag);
        }
        if (csv instanceof Boolean) {
            return tag == TypeTags.BOOLEAN_TAG || isJsonOrAnyDataOrAny(tag);
        }
        if (csv == null) {
            return tag == TypeTags.NULL_TAG || isJsonOrAnyDataOrAny(tag);
        }
        return false;
    }

    private static boolean isJsonOrAnyDataOrAny(int tag) {
        return tag == TypeTags.JSON_TAG || tag == TypeTags.ANYDATA_TAG || tag == TypeTags.ANY_TAG;
    }

    public static int getTheExpectedArraySize(Type type) {
        if (type instanceof TupleType tupleType) {
            if (tupleType.getRestType() != null) {
                return -1;
            }
            return tupleType.getTupleTypes().size();
        } else {
            return ((ArrayType) type).getSize();
        }
    }

    public static Map<String, String> processNameAnnotationsAndBuildCustomFieldMap(RecordType recordType,
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
        if (skipLines == null) {
            return EMPTY_LONG_ARRAY;
        }

        if (skipLines instanceof BArray skipLinesArray) {
            if (skipLinesArray.getLength() == 0) {
                return EMPTY_LONG_ARRAY;
            }
            return skipLinesArray.getIntArray();
        }

        return getSkipLinesFromStringConfigValue(StringUtils.getStringValue(skipLines));
    }

    public static boolean isNullValue(Object nullValue, Object value) {
        if (value == null) {
            return true;
        }
        if (value instanceof BString bString) {
            value = StringUtils.getStringValue(bString);
        }
        if (value instanceof String v) {
            return handleStringNullValue(nullValue, v, value);
        }
        return false;
    }

    private static boolean handleStringNullValue(Object nullValue, String v, Object value) {
        if ((nullValue == null) && (Constants.Values.NULL.equalsIgnoreCase(v)
                || Constants.Values.BALLERINA_NULL.equalsIgnoreCase(v))) {
            return true;
        }
        return nullValue != null && value.equals(StringUtils.getStringValue(nullValue));
    }

    public static boolean isCharContainsInLineTerminatorUserConfig(char c,
                   Object lineTerminatorObj, boolean isCarriageTokenPresent) {
        if (lineTerminatorObj instanceof BArray array) {
            Object[] lineTerminators = array.getValues();
            for (Object lineTerminator: lineTerminators) {
                Optional<Boolean> value = handleLineTerminator(lineTerminator, c, isCarriageTokenPresent);
                if (value.isEmpty()) {
                    continue;
                }
                return value.get();
            }
            return false;
        }

        Optional<Boolean> value = handleLineTerminator(lineTerminatorObj, c, isCarriageTokenPresent);
        if (value.isEmpty()) {
            return false;
        }
        return value.get();
    }

    private static Optional<Boolean> handleLineTerminator(Object lineTerminator,
              char c, boolean isCarriageTokenPresent) {
        if (lineTerminator == null || c != Constants.LineTerminator.LF) {
            return Optional.empty();
        }
        if (lineTerminator.equals(Constants.LineTerminator.CRLF)) {
            return Optional.of(isCarriageTokenPresent);
        }
        return Optional.of(true);
    }

    public static class UnMappedValue {
        public static final UnMappedValue VALUE = new UnMappedValue();
    }

    public static class SkipMappedValue {
        public static final SkipMappedValue VALUE = new SkipMappedValue();
    }

    public static Locale createLocaleFromString(String localeString) {
        // Split the string into language, country, and variant
        String[] parts = localeString.split(Constants.UNDERSCORE);
        int length = parts.length;
        if (length == 3) {
            return new Locale(parts[0], parts[1], parts[2]);
        } else if (length == 2) {
            return new Locale(parts[0], parts[1]);
        } else {
            return new Locale(parts[0]); // Only language
        }
    }

    public static void validateConfigs(CsvConfig config) {
        if (config.headerRows > 1 && config.customHeaders == null) {
            throw DiagnosticLog.error(DiagnosticErrorCode.NO_CUSTOM_HEADER_PROVIDED);
        }
    }
}

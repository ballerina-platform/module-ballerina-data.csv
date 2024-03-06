package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.JsonUtils;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BDecimal;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.stdlib.data.csvdata.csv.CsvConfig;
import io.ballerina.stdlib.data.csvdata.csv.CsvTraversal;
import io.ballerina.stdlib.data.csvdata.csv.QueryParser;

import java.util.Arrays;
import java.util.Map;

import static io.ballerina.runtime.api.TypeTags.INT_TAG;

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

    public static boolean isBasicType(Type type) {
        switch (type.getTag()) {
            case TypeTags.INT_TAG:
            case TypeTags.STRING_TAG:
            case TypeTags.BOOLEAN_TAG:
            case TypeTags.DECIMAL_TAG:
            case TypeTags.FLOAT_TAG:
            case TypeTags.NULL_TAG:
                return true;
            default:
                return false;
        }
    }

    public static void sortCsvData(BArray rootCsvNode, CsvConfig config) {
        Object orderConfiguration = config.orderBy;
        if (orderConfiguration == null) {
            return;
        }

        Object[] arrayValues = rootCsvNode.getValues();
        Arrays.sort(arrayValues, (value1, value2) -> compareCsvColumns(
                value1, value2, constructSortingColumnNames(orderConfiguration))
        );
    }

    public static int compareCsvColumns(Object row1, Object row2, SortConfigurations[] sortConfigurations) {
        Object o1,o2;
        int value;
        for (SortConfigurations sortConfig: sortConfigurations) {
            o1 = getRowValueForSort(row1, sortConfig.columnName);
            o2 = getRowValueForSort(row2, sortConfig.columnName);
            value = compareTwoColumnAndGetValue(o1, o2);

            if (value == 0) {
                continue;
            }
            if (sortConfig.sortOrder.equals(Constants.OrderConfigs.DESC)) {
                return -1 * value;
            }
            return value;
        }
        return 0;
    }

    public static Object getRowValueForSort(Object row, Object columnName) {
        if (row instanceof BMap) {
            return ((BMap) row).get(columnName);
        } else {
            if (columnName instanceof Long) {
                return ((BArray) row).get((long) columnName);
            } else {
                // TODO: Add a new error
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, "Test", "Test");
            }
        }
    }


    public static SortConfigurations[] constructSortingColumnNames(Object orderConfiguration) {
        BString columnName = Constants.OrderConfigs.COLUMN;
        BString sortOrder = Constants.OrderConfigs.COLUMN_ORDER;

        SortConfigurations[] columns = new SortConfigurations[]{};
        if (orderConfiguration instanceof BMap) {
            BMap orderConfigMap = (BMap<BString, Object>) orderConfiguration;
            columns[0] = new SortConfigurations(orderConfigMap.get(columnName), orderConfigMap.get(sortOrder));
        } else {
            BArray orderConfigArray = (BArray) orderConfiguration;
            for (int i = 0; i < orderConfigArray.size(); i++) {
                BMap orderConfigMap = (BMap) orderConfigArray.get(i);
                columns[i] = new SortConfigurations(orderConfigMap.get(columnName), orderConfigMap.get(sortOrder));
            }
        }
        return columns;
    }

    public static int compareTwoColumnAndGetValue(Object o1, Object o2) {
        if (o1 == null && o2 ==null) {
            return 0;
        }
        if (o1 == null) {
            return -1;
        }
        if (o2 == null) {
            return 1;
        }
        if (o1 instanceof Long && o2 instanceof Long) {
            return ((Long) o1).compareTo((Long) o2);
        }
        if (o1 instanceof Boolean && o2 instanceof Boolean) {
            return ((Boolean) o1).compareTo((Boolean) o2);
        }
        if (o1 instanceof BDecimal && o2 instanceof BDecimal) {
            return (((BDecimal) o1).decimalValue()).compareTo(((BDecimal) o1).decimalValue());
        }
        if (o1 instanceof Float && o2 instanceof Float) {
            return ((Float) o1).compareTo((Float) o2);
        }
        if (o1 instanceof Double && o2 instanceof Double) {
            return ((Double) o1).compareTo((Double) o2);
        }
        return (StringUtils.getStringValue(o1)).compareTo(StringUtils.getStringValue(o2));
    }

    public static boolean calculateNumberOfRows(long dataRowCount, int i, long skipDataRows) {
        return dataRowCount != -1 && i >= dataRowCount + skipDataRows;
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
            for (int i = 0; i < headers.length; i++) {
                headers[i] = array.get(i).toString();
            }
        }

        Object skipColumns = config.skipColumns;
        if (skipColumns == null) {
            return headers;
        }
        return QueryParser.parse(config.skipColumns, headers);
    }

    public static Object convertToBasicType(Object csv, Type targetType, CsvConfig config) {
        if (targetType.getTag() == TypeTags.READONLY_TAG) {
            return csv;
        }
        try {
            Object value = JsonUtils.convertJSON(csv, targetType);
            if (value == null) {
                return config.nullValue;
            }
            if (value instanceof String) {
                return StringUtils.fromString(value.toString());
            }
            return value;
        } catch (Exception e) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, targetType);
        }
    }

    public static void checkOptionalFieldsAndLogError(Map<String, Field> currentField) {
        currentField.values().forEach(field -> {
            if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
            }
            // TODO: Handle this properly
            if (!(SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED) &&
                    SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.OPTIONAL))) {
//                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
            }
        });
    }

    public static boolean checkTypeCompatibility(Type constraintType, Object csv) {
        // TODO: Remove this
        if (csv instanceof BMap) {
            BMap<BString, Object> map = (BMap<BString, Object>) csv;
            for (BString key : map.getKeys()) {
                if (!checkTypeCompatibility(constraintType, map.get(key))) {
                    return false;
                }
            }
            return true;
        } else if ((csv instanceof BString && constraintType.getTag() == TypeTags.STRING_TAG)
                || (csv instanceof Long && constraintType.getTag() == INT_TAG)
                || (csv instanceof BDecimal && constraintType.getTag() == TypeTags.DECIMAL_TAG)
                || (csv instanceof Double && (constraintType.getTag() == TypeTags.FLOAT_TAG
                || constraintType.getTag() == TypeTags.DECIMAL_TAG))
                || (Boolean.class.isInstance(csv) && constraintType.getTag() == TypeTags.BOOLEAN_TAG)
                || (csv == null && constraintType.getTag() == TypeTags.NULL_TAG)) {
            return true;
        } else {
            return false;
        }
    }

    public static void addValuesToArrayType(Object csvElement, Type arrayElementType, int index,
                                      Object currentCsvNode, CsvConfig config) {
        switch (arrayElementType.getTag()) {
            case TypeTags.NULL_TAG:
            case TypeTags.BOOLEAN_TAG:
            case INT_TAG:
            case TypeTags.FLOAT_TAG:
            case TypeTags.DECIMAL_TAG:
            case TypeTags.STRING_TAG:
            case TypeTags.XML_TAG:
                ((BArray) currentCsvNode).add(index, convertToBasicType(csvElement, arrayElementType, config));
                break;
            default:
                DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, arrayElementType);
        }
    }

    public static int getTheActualExpectedType(Type type) {
        if (type instanceof TupleType) {
            return ((TupleType) type).getTupleTypes().size();
        } else {
            return ((ArrayType) type).getSize();
        }
    }

    public static class SortConfigurations {
        protected Object columnName;
        protected Object sortOrder;

        public SortConfigurations(Object columnName, Object sortOrder) {
            this.columnName = columnName;
            this.sortOrder = sortOrder;
        }
    }
}

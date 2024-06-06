function generateErrorMessageForMissingRequiredField(string 'field) returns string {
    return string `no matching header value is found for the required field '${'field}'`;
}

function generateErrorMessageForInvalidCast(string value, string 'type) returns string {
    return string `value '${value}' cannot be cast into '${'type}'`;
}

function generateErrorMessageForInvalidFieldType(string value, string 'key) returns string {
    return string `no mapping type found for value '${value}' in key '${'key}'`;
}

function generateErrorMessageForInvalidValueForArrayType(string value, string index, string arrayType) returns string {
    return string `value '${value}' in index '${index}' is not compatible with array type '${arrayType}'`;
}

function generateErrorMessageForInvalidHeaders(string value, string 'type) returns string{
    return string `value '${value}' cannot be cast into '${'type}', because fields in '${'type}' or the provided expected headers are not matching with the '${value}'`;
}

function generateErrorMessageForInvalidCustomHeader(string header) returns string{
    return string `Invalid header value: '${header}'`;
}

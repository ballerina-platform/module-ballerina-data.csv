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

import io.ballerina.compiler.api.ModuleID;
import io.ballerina.compiler.api.SemanticModel;
import io.ballerina.compiler.api.symbols.AnnotationAttachmentSymbol;
import io.ballerina.compiler.api.symbols.AnnotationSymbol;
import io.ballerina.compiler.api.symbols.ArrayTypeSymbol;
import io.ballerina.compiler.api.symbols.IntersectionTypeSymbol;
import io.ballerina.compiler.api.symbols.ModuleSymbol;
import io.ballerina.compiler.api.symbols.RecordFieldSymbol;
import io.ballerina.compiler.api.symbols.RecordTypeSymbol;
import io.ballerina.compiler.api.symbols.Symbol;
import io.ballerina.compiler.api.symbols.SymbolKind;
import io.ballerina.compiler.api.symbols.TupleTypeSymbol;
import io.ballerina.compiler.api.symbols.TypeDefinitionSymbol;
import io.ballerina.compiler.api.symbols.TypeDescKind;
import io.ballerina.compiler.api.symbols.TypeReferenceTypeSymbol;
import io.ballerina.compiler.api.symbols.TypeSymbol;
import io.ballerina.compiler.api.symbols.UnionTypeSymbol;
import io.ballerina.compiler.api.symbols.VariableSymbol;
import io.ballerina.compiler.syntax.tree.AssignmentStatementNode;
import io.ballerina.compiler.syntax.tree.BasicLiteralNode;
import io.ballerina.compiler.syntax.tree.CheckExpressionNode;
import io.ballerina.compiler.syntax.tree.ChildNodeList;
import io.ballerina.compiler.syntax.tree.ExpressionNode;
import io.ballerina.compiler.syntax.tree.FunctionArgumentNode;
import io.ballerina.compiler.syntax.tree.FunctionCallExpressionNode;
import io.ballerina.compiler.syntax.tree.FunctionDefinitionNode;
import io.ballerina.compiler.syntax.tree.IdentifierToken;
import io.ballerina.compiler.syntax.tree.ImportDeclarationNode;
import io.ballerina.compiler.syntax.tree.ListConstructorExpressionNode;
import io.ballerina.compiler.syntax.tree.MappingConstructorExpressionNode;
import io.ballerina.compiler.syntax.tree.MappingFieldNode;
import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModulePartNode;
import io.ballerina.compiler.syntax.tree.ModuleVariableDeclarationNode;
import io.ballerina.compiler.syntax.tree.NameReferenceNode;
import io.ballerina.compiler.syntax.tree.NamedArgumentNode;
import io.ballerina.compiler.syntax.tree.NilLiteralNode;
import io.ballerina.compiler.syntax.tree.Node;
import io.ballerina.compiler.syntax.tree.PositionalArgumentNode;
import io.ballerina.compiler.syntax.tree.QualifiedNameReferenceNode;
import io.ballerina.compiler.syntax.tree.SeparatedNodeList;
import io.ballerina.compiler.syntax.tree.SpecificFieldNode;
import io.ballerina.compiler.syntax.tree.SyntaxKind;
import io.ballerina.compiler.syntax.tree.TypeDefinitionNode;
import io.ballerina.compiler.syntax.tree.VariableDeclarationNode;
import io.ballerina.projects.plugins.AnalysisTask;
import io.ballerina.projects.plugins.SyntaxNodeAnalysisContext;
import io.ballerina.tools.diagnostics.Diagnostic;
import io.ballerina.tools.diagnostics.DiagnosticFactory;
import io.ballerina.tools.diagnostics.DiagnosticInfo;
import io.ballerina.tools.diagnostics.DiagnosticSeverity;
import io.ballerina.tools.diagnostics.Location;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

/**
 * CsvData Record Field Validator.
 *
 * @since 0.1.0
 */
public class CsvDataTypeValidator implements AnalysisTask<SyntaxNodeAnalysisContext> {

    private SemanticModel semanticModel;
    private final HashMap<Location, DiagnosticInfo> allDiagnosticInfo = new HashMap<>();
    Location currentLocation;
    private String modulePrefix = Constants.CSVDATA;

    @Override
    public void perform(SyntaxNodeAnalysisContext ctx) {
        semanticModel = ctx.semanticModel();
        List<Diagnostic> diagnostics = semanticModel.diagnostics();
        boolean erroneousCompilation = diagnostics.stream()
                .anyMatch(d -> d.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR));
        if (erroneousCompilation) {
            reset();
            return;
        }

        ModulePartNode rootNode = (ModulePartNode) ctx.node();
        updateModulePrefix(rootNode);

        for (ModuleMemberDeclarationNode member : rootNode.members()) {
            switch (member.kind()) {
                case FUNCTION_DEFINITION -> processFunctionDefinitionNode((FunctionDefinitionNode) member, ctx);
                case MODULE_VAR_DECL ->
                        processModuleVariableDeclarationNode((ModuleVariableDeclarationNode) member, ctx);
                case TYPE_DEFINITION ->
                        processTypeDefinitionNode((TypeDefinitionNode) member, ctx);
            }
        }
        reset();
    }

    private void reset() {
        semanticModel = null;
        allDiagnosticInfo.clear();
        currentLocation = null;
        modulePrefix = Constants.CSVDATA;
    }

    private void updateModulePrefix(ModulePartNode rootNode) {
        for (ImportDeclarationNode importDeclarationNode : rootNode.imports()) {
            semanticModel.symbol(importDeclarationNode)
                    .filter(moduleSymbol -> moduleSymbol.kind() == SymbolKind.MODULE)
                    .filter(moduleSymbol -> isCsvDataImport((ModuleSymbol) moduleSymbol))
                    .ifPresent(moduleSymbol -> modulePrefix = ((ModuleSymbol) moduleSymbol).id().modulePrefix());
        }
    }

    private void processFunctionDefinitionNode(FunctionDefinitionNode functionDefinitionNode,
                                               SyntaxNodeAnalysisContext ctx) {
        ChildNodeList childNodeList = functionDefinitionNode.functionBody().children();
        for (Node node : childNodeList) {
            if (node.kind() == SyntaxKind.LOCAL_VAR_DECL) {
                processLocalVarDeclNode((VariableDeclarationNode) node, ctx);
            } else if (node.kind() == SyntaxKind.ASSIGNMENT_STATEMENT) {
                processAssignmentStmtNode((AssignmentStatementNode) node, ctx);
            }
        }
    }

    private void processAssignmentStmtNode(AssignmentStatementNode assignmentStatementNode,
                                           SyntaxNodeAnalysisContext ctx) {
        ExpressionNode expressionNode = assignmentStatementNode.expression();
        if (!isParseFunctionOfStringSource(expressionNode)) {
            return;
        }
        currentLocation = assignmentStatementNode.location();
        semanticModel.symbol(assignmentStatementNode.varRef())
            .map(symbol -> ((VariableSymbol) symbol).typeDescriptor())
            .ifPresent(typeSymbol -> validateFunctionParameterTypes(expressionNode, typeSymbol, currentLocation, ctx));
    }

    private void processLocalVarDeclNode(VariableDeclarationNode variableDeclarationNode,
                                         SyntaxNodeAnalysisContext ctx) {
        Optional<ExpressionNode> initializer = variableDeclarationNode.initializer();
        if (initializer.isEmpty()) {
            return;
        }

        currentLocation = variableDeclarationNode.typedBindingPattern().typeDescriptor().location();
        Optional<Symbol> symbol = semanticModel.symbol(variableDeclarationNode.typedBindingPattern());
        if (symbol.isEmpty()) {
            return;
        }

        TypeSymbol typeSymbol = ((VariableSymbol) symbol.get()).typeDescriptor();
        ExpressionNode expressionNode = initializer.get();
        if (!isParseFunctionOfStringSource(expressionNode)) {
            checkTypeAndDetectDuplicateFields(typeSymbol, ctx);
            return;
        }
        validateExpectedType(typeSymbol, currentLocation, ctx);
        validateFunctionParameterTypes(expressionNode, typeSymbol, expressionNode.location(), ctx);
    }

    private void checkTypeAndDetectDuplicateFields(TypeSymbol typeSymbol, SyntaxNodeAnalysisContext ctx) {
        switch (typeSymbol.typeKind()) {
            case RECORD -> detectDuplicateFields((RecordTypeSymbol) typeSymbol, ctx);
            case ARRAY -> checkTypeAndDetectDuplicateFields(((ArrayTypeSymbol) typeSymbol).memberTypeDescriptor(), ctx);
            case TUPLE -> {
                for (TypeSymbol memberType : ((TupleTypeSymbol) typeSymbol).memberTypeDescriptors()) {
                    checkTypeAndDetectDuplicateFields(memberType, ctx);
                }
            }
            case UNION -> {
                for (TypeSymbol memberType : ((UnionTypeSymbol) typeSymbol).memberTypeDescriptors()) {
                    checkTypeAndDetectDuplicateFields(memberType, ctx);
                }
            }
            case TYPE_REFERENCE -> checkTypeAndDetectDuplicateFields(
                    ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor(), ctx);
            case INTERSECTION -> checkTypeAndDetectDuplicateFields(getRawType(typeSymbol), ctx);
        }
    }

    private FunctionCallExpressionNode getFunctionCallExpressionNodeIfPresent(ExpressionNode expressionNode) {
        return switch(expressionNode.kind()) {
            case CHECK_EXPRESSION -> getFunctionCallExpressionNodeIfPresent(
                    ((CheckExpressionNode) expressionNode).expression());
            case FUNCTION_CALL -> (FunctionCallExpressionNode) expressionNode;
            default -> null;
        };
    }

    private Optional<String> getFunctionName(FunctionCallExpressionNode node) {
        NameReferenceNode nameReferenceNode = node.functionName();
        if (nameReferenceNode.kind() != SyntaxKind.QUALIFIED_NAME_REFERENCE) {
            return Optional.empty();
        }
        QualifiedNameReferenceNode qualifiedNameReferenceNode = (QualifiedNameReferenceNode) nameReferenceNode;
        String prefix = qualifiedNameReferenceNode.modulePrefix().text();
        if (!prefix.equals(modulePrefix)) {
            return Optional.empty();
        }
        return Optional.of(qualifiedNameReferenceNode.identifier().text());
    }

    private boolean isParseFunctionOfStringSource(ExpressionNode expressionNode) {
        FunctionCallExpressionNode node = getFunctionCallExpressionNodeIfPresent(expressionNode);
        if (node == null) {
            return false;
        }
        Optional<String> functionName = getFunctionName(node);
        return functionName
                .map(fn -> fn.contains(Constants.PARSE_STRING) || fn.contains(Constants.PARSE_BYTES) ||
                        fn.contains(Constants.PARSE_STREAM) || fn.contains(Constants.TRANSFORM) ||
                        fn.contains(Constants.PARSE_LISTS))
                .orElse(false);
    }

    private void validateFunctionParameterTypes(ExpressionNode expressionNode,
                                                TypeSymbol expType,
                                                Location currentLocation, SyntaxNodeAnalysisContext ctx) {
        FunctionCallExpressionNode node = getFunctionCallExpressionNodeIfPresent(expressionNode);
        if (node == null) {
            return;
        }
        Optional<String> functionName = getFunctionName(node);
        SeparatedNodeList<FunctionArgumentNode> args = node.arguments();
        functionName.ifPresent(fn ->
                validateFunctionParameterTypesWithExpType(expType, currentLocation, ctx, fn, args));
    }

    private void validateFunctionParameterTypesWithExpType(TypeSymbol expType, Location currentLocation,
                   SyntaxNodeAnalysisContext ctx, String functionName, SeparatedNodeList<FunctionArgumentNode> args) {
        switch (expType.typeKind()) {
            case ARRAY -> validateFunctionParameterTypesWithArrayType(
                    (ArrayTypeSymbol) expType, currentLocation, ctx, functionName, args);
            case TYPE_REFERENCE -> validateFunctionParameterTypesWithExpType(
                    ((TypeReferenceTypeSymbol) expType).typeDescriptor(), currentLocation, ctx, functionName, args);
            case INTERSECTION -> validateFunctionParameterTypesWithExpType(
                    getRawType(expType), currentLocation, ctx, functionName, args);
            case UNION -> {
                List<TypeSymbol> memberTypes = ((UnionTypeSymbol) expType).memberTypeDescriptors();

                // only handles the A|error scenarios
                if (memberTypes.size() == 2) {
                    if (isUnionContainsError(memberTypes)) {
                        TypeSymbol nonErrorTypeSymbol = ignoreErrorTypeFromUnionTypeSymbolAndReturn(memberTypes);
                        if (nonErrorTypeSymbol != null) {
                            validateFunctionParameterTypesWithExpType(nonErrorTypeSymbol, currentLocation,
                                    ctx, functionName, args);
                        }
                    }
                }
            }
        }
    }

    private boolean isUnionContainsError(List<TypeSymbol> memberTypes) {
        for (TypeSymbol memberSymbol : memberTypes) {
            if (memberSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
                memberSymbol = ((TypeReferenceTypeSymbol) memberSymbol).typeDescriptor();
            }
            if (memberSymbol.typeKind() == TypeDescKind.ERROR) {
                // ignore error type
                return true;
            }
        }
        return false;
    }

    private TypeSymbol ignoreErrorTypeFromUnionTypeSymbolAndReturn(List<TypeSymbol> memberTypes) {
        for (TypeSymbol memberSymbol : memberTypes) {
            if (memberSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
                memberSymbol = ((TypeReferenceTypeSymbol) memberSymbol).typeDescriptor();
            }
            if (memberSymbol.typeKind() == TypeDescKind.ERROR) {
                // ignore error type
                continue;
            }
            return memberSymbol;
        }
        return null;
    }

    private void validateFunctionParameterTypesWithArrayType(ArrayTypeSymbol expType, Location currentLocation,
                                                             SyntaxNodeAnalysisContext ctx, String functionName,
                                                             SeparatedNodeList<FunctionArgumentNode> args) {
        TypeSymbol memberTypeSymbol = expType.memberTypeDescriptor();
        if (memberTypeSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
            memberTypeSymbol = ((TypeReferenceTypeSymbol) memberTypeSymbol).typeDescriptor();
        }
        switch (memberTypeSymbol.typeKind()) {
            case RECORD, MAP -> validateFunctionParameterTypesWithOptions(
                    currentLocation, ctx, functionName, args, true);
            case ARRAY, TUPLE -> validateFunctionParameterTypesWithOptions(
                    currentLocation, ctx, functionName, args, false);
        }
    }

    private void validateFunctionParameterTypesWithOptions(Location currentLocation, SyntaxNodeAnalysisContext ctx,
                   String functionName, SeparatedNodeList<FunctionArgumentNode> args, boolean isRecord) {
        ExpressionNode expression;
        SeparatedNodeList<MappingFieldNode> fields;
        String header = null, headerRows = null, customHeaders = null,
                customHeadersIfHeaderAbsent = null, outputWithHeaders = null, headerOrder = null;
        boolean isCustomHeaderPresent = false;
        for (FunctionArgumentNode arg : args) {
            int mappingConstructorExprNodeCount = 0;
            if (arg instanceof PositionalArgumentNode positionalArgumentNode) {
                expression = positionalArgumentNode.expression();
            } else if (arg instanceof NamedArgumentNode namedArgumentNode) {
                expression = namedArgumentNode.expression();
            } else {
                continue;
            }
            if (expression instanceof MappingConstructorExpressionNode mappingConstructorExpressionNode) {
                checkAndAssertMappingConstructorArguments(mappingConstructorExprNodeCount);
                fields = mappingConstructorExpressionNode.fields();
                for (MappingFieldNode field : fields) {
                    if (field instanceof SpecificFieldNode specificFieldNode) {
                        Node node = specificFieldNode.fieldName();
                        if (node instanceof IdentifierToken identifierToken) {
                            String fieldName = identifierToken.text();
                            switch (fieldName) {
                                case Constants.UserConfigurations.HEADER ->
                                        header = getTheValueOfTheUserConfigOption(specificFieldNode);
                                case Constants.UserConfigurations.CUSTOM_HEADERS_IF_ABSENT ->
                                        customHeadersIfHeaderAbsent =
                                                getTheValueOfTheUserConfigOption(specificFieldNode);
                                case Constants.UserConfigurations.HEADERS_ROWS ->
                                        headerRows = getTheValueOfTheUserConfigOption(specificFieldNode);
                                case Constants.UserConfigurations.CUSTOM_HEADERS -> {
                                    customHeaders = getTheValueOfTheUserConfigOption(specificFieldNode);
                                    isCustomHeaderPresent = true;
                                }
                                case Constants.UserConfigurations.HEADERS_ORDER -> {
                                    if (isRecord) {
                                        headerOrder = getTheValueOfTheUserConfigOption(specificFieldNode);
                                    }
                                }
                                case Constants.UserConfigurations.OUTPUT_WITH_HEADERS -> {
                                    if (isRecord) {
                                        outputWithHeaders = getTheValueOfTheUserConfigOption(specificFieldNode);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throwErrorsIfIgnoredFieldFoundForOutputs(header, customHeadersIfHeaderAbsent, headerRows,
                customHeaders, isCustomHeaderPresent, headerOrder,
                outputWithHeaders, ctx, currentLocation, functionName, isRecord);
    }

    private void checkAndAssertMappingConstructorArguments(int mappingConstructorExprNodeCount) {
        if (mappingConstructorExprNodeCount > 1) {
            assert false : "MappingConstructorExpressionNode count in the function " +
                    "arguments should be less than or equal to 1";
        }
    }

    private void throwErrorsIfIgnoredFieldFoundForOutputs(String header, String customHeadersIfHeaderAbsent,
            String headerRows, String customHeaders, boolean isCustomHeaderPresent, String headerOrder,
            String outputWithHeaders, SyntaxNodeAnalysisContext ctx, Location currentLocation,
            String functionName, boolean isRecord) {
        switch (functionName) {
            case Constants.PARSE_STRING -> {
                if (header != null && !(header.equals(Constants.NIL) || header.equals(Constants.NULL))
                        && customHeadersIfHeaderAbsent != null && !customHeadersIfHeaderAbsent.equals(Constants.NIL)
                        && !customHeadersIfHeaderAbsent.equals(Constants.NULL)) {
                    reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation),
                            CsvDataDiagnosticCodes.IGNORE_CUSTOM_HEADERS_PARAMETER_WHEN_HEADER_PRESENT);
                }
            }
            case Constants.PARSE_LISTS -> {
                if (headerRows != null && !headerRows.equals("0") && !headerRows.equals("1")
                        && (!isCustomHeaderPresent || (customHeaders != null &&
                        (customHeaders.equals(Constants.NIL) || customHeaders.equals(Constants.NULL))))) {
                    reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation),
                            CsvDataDiagnosticCodes.CUSTOM_HEADERS_SHOULD_BE_PROVIDED);
                }
            }
            case Constants.TRANSFORM -> {
                if (isRecord && headerOrder != null && !headerOrder.equals(Constants.NIL)
                        && !headerOrder.equals(Constants.NULL)) {
                    reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation),
                            CsvDataDiagnosticCodes.IGNORE_HEADERS_ORDER_FOR_RECORD_ARRAY);
                }
            }
        }
        if (isRecord && outputWithHeaders != null) {
            reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation),
                    CsvDataDiagnosticCodes.IGNORE_OUTPUT_HEADERS_FOR_RECORD_ARRAY);
        }
    }

    private String getTheValueOfTheUserConfigOption(SpecificFieldNode specificFieldNode) {
        return specificFieldNode.valueExpr().map(expNode -> {
            if (expNode instanceof BasicLiteralNode basicLiteralNode) {
                return basicLiteralNode.literalToken().text();
            }
            if (expNode instanceof ListConstructorExpressionNode listConstructorExpressionNode) {
                return listConstructorExpressionNode.expressions().toString();
            }
            if (expNode instanceof NilLiteralNode) {
                return Constants.NIL;
            }
            return null;
        }).orElse(null);
    }

    private void validateExpectedType(TypeSymbol typeSymbol, Location currentLocation, SyntaxNodeAnalysisContext ctx) {
        switch (typeSymbol.typeKind()) {
            case UNION -> validateUnionType((UnionTypeSymbol) typeSymbol, currentLocation, ctx);
            case ARRAY -> validateArrayType((ArrayTypeSymbol) typeSymbol, currentLocation, ctx);
            case TUPLE -> validateTupleType(currentLocation, ctx);
            case TYPE_REFERENCE -> validateExpectedType(((TypeReferenceTypeSymbol) typeSymbol)
                    .typeDescriptor(), currentLocation, ctx);
            case INTERSECTION -> validateExpectedType(getRawType(typeSymbol), currentLocation, ctx);
        }
    }

    private void validateTupleType(Location currentLocation, SyntaxNodeAnalysisContext ctx) {
        // Currently, this is unsupported.
        reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation), CsvDataDiagnosticCodes.UNSUPPORTED_TYPE);
    }

    private void validateArrayType(ArrayTypeSymbol typeSymbol,
                                   Location currentLocation, SyntaxNodeAnalysisContext ctx) {
        if (!isSupportedArrayMemberType(ctx, currentLocation, typeSymbol.memberTypeDescriptor())) {
            reportDiagnosticInfo(ctx, Optional.ofNullable(currentLocation), CsvDataDiagnosticCodes.UNSUPPORTED_TYPE);
        }
    }

    private void validateUnionType(UnionTypeSymbol unionTypeSymbol,
                                   Location currentLocation, SyntaxNodeAnalysisContext ctx) {
        List<TypeSymbol> memberTypeSymbols = unionTypeSymbol.memberTypeDescriptors();
        for (TypeSymbol memberTypeSymbol : memberTypeSymbols) {
            validateExpectedType(memberTypeSymbol, currentLocation, ctx);
        }
    }

    private boolean isSupportedArrayMemberType(SyntaxNodeAnalysisContext ctx,
                                               Location currentLocation, TypeSymbol typeSymbol) {
        if (typeSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
            typeSymbol = ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor();
        }
        if (typeSymbol.typeKind() == TypeDescKind.INTERSECTION) {
            typeSymbol = getRawType(typeSymbol);
        }
        TypeDescKind kind = typeSymbol.typeKind();
        if (kind == TypeDescKind.TYPE_REFERENCE) {
            kind = ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor().typeKind();
        }

        switch (kind) {
            case ARRAY, MAP, UNION, INTERSECTION -> {
                return true;
            }
            case RECORD -> validateRecordFields(ctx, currentLocation, typeSymbol);
            case TUPLE -> validateTupleMembers(ctx, currentLocation, typeSymbol);
            default -> {
                return false;
            }
        }
        return true;
    }

    private void validateTupleMembers(SyntaxNodeAnalysisContext ctx, Location currentLocation, TypeSymbol typeSymbol) {
        if (typeSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
            typeSymbol = ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor();
        }
        TupleTypeSymbol tupleTypeSymbol = (TupleTypeSymbol) typeSymbol;
        tupleTypeSymbol.memberTypeDescriptors().forEach(symbol ->
                validateNestedTypeSymbols(ctx, currentLocation, symbol, false));
        tupleTypeSymbol.restTypeDescriptor().ifPresent(restSym ->
                validateNestedTypeSymbols(ctx, currentLocation, restSym, false));
    }

    private void validateRecordFields(SyntaxNodeAnalysisContext ctx, Location currentLocation, TypeSymbol typeSymbol) {
        if (typeSymbol.typeKind() == TypeDescKind.TYPE_REFERENCE) {
            typeSymbol = ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor();
        }
        RecordTypeSymbol recordTypeSymbol = (RecordTypeSymbol) typeSymbol;

        recordTypeSymbol.typeInclusions().forEach(symbol ->
                validateNestedTypeSymbols(ctx, currentLocation, symbol, true));

        recordTypeSymbol.fieldDescriptors().values().forEach(field -> validateNestedTypeSymbols(ctx,
                currentLocation, field.typeDescriptor(), true));

        recordTypeSymbol.restTypeDescriptor().ifPresent(restSym ->
                validateNestedTypeSymbols(ctx, currentLocation, restSym, true));
    }

    private void validateNestedTypeSymbols(SyntaxNodeAnalysisContext ctx,
                                           Location location, TypeSymbol typeSymbol, boolean isField) {
        TypeDescKind kind = typeSymbol.typeKind();
        if (kind == TypeDescKind.TYPE_REFERENCE) {
            kind = ((TypeReferenceTypeSymbol) typeSymbol).typeDescriptor().typeKind();
        }

        switch (kind) {
            case ARRAY, OBJECT, RECORD, MAP, ERROR, FUNCTION, TUPLE, STREAM, FUTURE, TYPEDESC,
                 TYPE_REFERENCE, XML, XML_ELEMENT, XML_PROCESSING_INSTRUCTION, XML_COMMENT,
                 XML_TEXT, HANDLE, TABLE, NEVER, REGEXP  ->
                 reportDiagnosticInfo(ctx, Optional.ofNullable(location),
                         isField ? CsvDataDiagnosticCodes.UNSUPPORTED_FIELD_TYPE
                        : CsvDataDiagnosticCodes.UNSUPPORTED_TUPLE_MEMBER_TYPE);
        }
    }

    public static TypeSymbol getRawType(TypeSymbol typeDescriptor) {
        if (typeDescriptor.typeKind() == TypeDescKind.INTERSECTION) {
            return getRawType(((IntersectionTypeSymbol) typeDescriptor).effectiveTypeDescriptor());
        }
        if (typeDescriptor.typeKind() == TypeDescKind.TYPE_REFERENCE) {
            TypeReferenceTypeSymbol typeRef = (TypeReferenceTypeSymbol) typeDescriptor;
            TypeSymbol refType = typeRef.typeDescriptor();
            return switch (refType.typeKind()) {
                case TYPE_REFERENCE, INTERSECTION -> getRawType(refType);
                default -> refType;
            };
        }
        return typeDescriptor;
    }

    private void reportDiagnosticInfo(SyntaxNodeAnalysisContext ctx, Optional<Location> location,
                                      CsvDataDiagnosticCodes diagnosticsCodes) {
        Location pos = location.orElseGet(() -> currentLocation);
        DiagnosticInfo diagnosticInfo = new DiagnosticInfo(diagnosticsCodes.getCode(),
                diagnosticsCodes.getMessage(), diagnosticsCodes.getSeverity());
        if (pos == null || Objects.equals(allDiagnosticInfo.get(pos), diagnosticInfo)) {
            return;
        }

        allDiagnosticInfo.put(pos, diagnosticInfo);
        ctx.reportDiagnostic(DiagnosticFactory.createDiagnostic(diagnosticInfo, pos));
    }

    private void processModuleVariableDeclarationNode(ModuleVariableDeclarationNode moduleVariableDeclarationNode,
                                                      SyntaxNodeAnalysisContext ctx) {
        Optional<ExpressionNode> initializer = moduleVariableDeclarationNode.initializer();
        currentLocation = moduleVariableDeclarationNode.typedBindingPattern().typeDescriptor().location();
        if (initializer.isEmpty()) {
            return;
        }
        ExpressionNode expressionNode = initializer.get();
        if (!isParseFunctionOfStringSource(expressionNode)) {
            return;
        }

        Optional<Symbol> symbol = semanticModel.symbol(moduleVariableDeclarationNode.typedBindingPattern());
        symbol.map(s -> (VariableSymbol) s).map(VariableSymbol::typeDescriptor)
                .ifPresent(s -> {
                    validateExpectedType(s, currentLocation, ctx);
                    validateFunctionParameterTypes(expressionNode, s, expressionNode.location(), ctx);
                });
    }

    private void processTypeDefinitionNode(TypeDefinitionNode typeDefinitionNode, SyntaxNodeAnalysisContext ctx) {
        Node typeDescriptor = typeDefinitionNode.typeDescriptor();
        currentLocation = typeDefinitionNode.typeDescriptor().location();
        if (typeDescriptor.kind() != SyntaxKind.RECORD_TYPE_DESC) {
            return;
        }
        validateRecordTypeDefinition(typeDefinitionNode, ctx);
    }

    private void validateRecordTypeDefinition(TypeDefinitionNode typeDefinitionNode, SyntaxNodeAnalysisContext ctx) {
        semanticModel.symbol(typeDefinitionNode)
                .map(symbol -> (TypeDefinitionSymbol) symbol)
                .ifPresent(typeDefinitionSymbol ->
                        detectDuplicateFields((RecordTypeSymbol) typeDefinitionSymbol.typeDescriptor(), ctx));
    }

    private void detectDuplicateFields(RecordTypeSymbol recordTypeSymbol, SyntaxNodeAnalysisContext ctx) {
        Set<String> fieldMembers = new HashSet<>();
        for (Map.Entry<String, RecordFieldSymbol> entry : recordTypeSymbol.fieldDescriptors().entrySet()) {
            RecordFieldSymbol fieldSymbol = entry.getValue();
            String name = getNameFromAnnotation(entry.getKey(), fieldSymbol.annotAttachments());
            if (!fieldMembers.add(name)) {
                reportDiagnosticInfo(ctx, fieldSymbol.getLocation(), CsvDataDiagnosticCodes.DUPLICATE_FIELD);
                return;
            }
        }
    }

    private String getNameFromAnnotation(String fieldName,
                                         List<AnnotationAttachmentSymbol> annotationAttachments) {
        for (AnnotationAttachmentSymbol annotAttSymbol : annotationAttachments) {
            AnnotationSymbol annotation = annotAttSymbol.typeDescriptor();
            if (!getAnnotModuleName(annotation).contains(Constants.CSVDATA)) {
                continue;
            }
            Optional<String> nameAnnot = annotation.getName();
            if (nameAnnot.isEmpty()) {
                continue;
            }
            String value = nameAnnot.get();
            if (value.equals(Constants.NAME)) {
                return ((LinkedHashMap<?, ?>) annotAttSymbol.attachmentValue().orElseThrow().value())
                        .get("value").toString();
            }
        }
        return fieldName;
    }

    private String getAnnotModuleName(AnnotationSymbol annotation) {
        return annotation.getModule().flatMap(ms -> ms.getName()).orElse("");
    }

    private boolean isCsvDataImport(ModuleSymbol moduleSymbol) {
        ModuleID moduleId = moduleSymbol.id();
        return Constants.BALLERINA.equals(moduleId.orgName())
                && Constants.DATA_CSVDATA.equals(moduleId.moduleName());
    }
}

<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2016 Adobe Systems Incorporated
 ~  All Rights Reserved.
 ~
 ~ NOTICE:  All information contained herein is, and remains
 ~ the property of Adobe Systems Incorporated and its suppliers,
 ~ if any.  The intellectual and technical concepts contained
 ~ herein are proprietary to Adobe Systems Incorporated and its
 ~ suppliers and may be covered by U.S. and Foreign Patents,
 ~ patents in process, and are protected by trade secret or copyright law.
 ~ Dissemination of this information or reproduction of this material
 ~ is strictly forbidden unless prior written permission is obtained
 ~ from Adobe Systems Incorporated.
 --------------------------------------------------------------------------%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.service.GuideModelImporter" %>
<%@ page import="com.adobe.aemds.guide.service.GuideSchemaType" %>
<%@ page import="org.apache.sling.api.resource.ValueMap" %>
<%@ page import="com.adobe.aemds.guide.common.GuideContainer" %>
<%@ page import="com.adobe.aemds.guide.utils.SchemaImportOptions" %>
<%
    GuideModelImporter guidemodelimporter = sling.getService(GuideModelImporter.class);
    response.setContentType("application/json; charset=UTF-8");
    ValueMap propsMap = resource.adaptTo(ValueMap.class);
    GuideContainer guideContainer = GuideContainer.from(resource);
    String schemaRef = guideContainer.getSchemaRef();
    if (schemaRef.startsWith("/assets")) {
        schemaRef = resource.getPath() + GuideConstants.RELATIVE_PATH_TO_JSON_NODE;
    } else {
        schemaRef += GuideConstants.ASSET_RENDITION;
    }
    String fragmentModelRoot = (String) propsMap.get(GuideConstants.FRAGMENT_MODEL_ROOT);
    SchemaImportOptions schemaImportOptions = new SchemaImportOptions();
    schemaImportOptions.setSchemaType(GuideSchemaType.JSON);
    schemaImportOptions.setFragmentModelRoot(fragmentModelRoot);
    schemaImportOptions.setSchemaPath(schemaRef);
    out.println(guidemodelimporter.createFragmentJsonFromSchema(schemaImportOptions));
%>
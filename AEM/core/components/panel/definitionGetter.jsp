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
<%@ page import="com.adobe.aemds.guide.utils.*" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="com.adobe.aemds.guide.service.GuideSchemaType" %>
<%
    GuideModelImporter guidemodelimporter = sling.getService(GuideModelImporter.class);
    String schemaType = request.getParameter("schemaType");
    GuideSchemaType guideSchemaType;
    if(schemaType!= null && schemaType.equals(GuideConstants.JSON_SCHEMA)){
        guideSchemaType = GuideSchemaType.JSON;
    } else if (schemaType != null && schemaType.equals(GuideConstants.FDM)) {
        guideSchemaType = GuideSchemaType.FDM;
    } else {
        guideSchemaType = GuideSchemaType.XSD;
    }
    String type = guidemodelimporter.getDefinitionOfElement(guideSchemaType, request.getParameter("schemaRef"), request.getParameter("rootName"), request.getParameter("path"));
    response.setContentType("application/json; charset=UTF-8");
    StringWriter stringWriter = new StringWriter();
    CustomJSONWriter jsonWriter = new CustomJSONWriter(stringWriter);
    jsonWriter.object();
    jsonWriter.key("type").value(type);
    jsonWriter.endObject();
    out.print(stringWriter.toString());
%>

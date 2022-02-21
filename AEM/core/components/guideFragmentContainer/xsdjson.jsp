<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2015 Adobe Systems Incorporated
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
<%@page import="org.apache.sling.api.resource.ResourceResolver"%>
<%@page import="org.apache.sling.api.resource.Resource" %>
<%@page import="org.apache.sling.api.SlingHttpServletRequest" %>
<%@ page import="com.adobe.aemds.guide.utils.SchemaImportOptions" %>
<%@ page import="com.adobe.aemds.guide.service.GuideSchemaType" %>
<%
    GuideModelImporter guidemodelimporter = sling.getService(GuideModelImporter.class);
    response.setContentType("application/json; charset=UTF-8");
    SchemaImportOptions schemaImportOptions = new SchemaImportOptions();
    schemaImportOptions.setSchemaType(GuideSchemaType.XSD);
    schemaImportOptions.setGuideContainer(resource);
    out.println(guidemodelimporter.createFragmentJsonFromSchema(schemaImportOptions));
%>
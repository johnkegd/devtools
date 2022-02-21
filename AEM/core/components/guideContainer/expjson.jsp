<%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ ADOBE CONFIDENTIAL
  ~ ___________________
  ~ Copyright 2015 Adobe Systems Incorporated
  ~ All Rights Reserved.
  ~
  ~ NOTICE:  All information contained herein is, and remains
  ~ the property of Adobe Systems Incorporated and its suppliers,
  ~ if any.  The intellectual and technical concepts contained
  ~ herein are proprietary to Adobe Systems Incorporated and its
  ~ suppliers and are protected by all applicable intellectual property
  ~ laws, including trade secret and copyright laws.
  ~ Dissemination of this information or reproduction of this material
  ~ is strictly forbidden unless prior written permission is obtained
  ~ from Adobe Systems Incorporated.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.service.GuideModelTransformer" %>
<%@ page import="com.adobe.aemds.guide.transformer.impl.ExpressionEditorResourcePropertyTransformer" %>
<%
    GuideModelTransformer guideModelTransformer = sling.getService(GuideModelTransformer.class);
    response.setContentType("application/json; charset=UTF-8");
    out.println(guideModelTransformer.getAdaptiveFormTreeJSON(resource,new ExpressionEditorResourcePropertyTransformer()));
%>
<%--
  ~
  ~ ADOBE CONFIDENTIAL
  ~ ___________________
  ~
  ~ Copyright 2019 Adobe Systems Incorporated
  ~ All Rights Reserved.
  ~
  ~ NOTICE:  All information contained herein is, and remains
  ~ the property of Adobe Systems Incorporated and its suppliers,
  ~ if any.  The intellectual and technical concepts contained
  ~ herein are proprietary to Adobe Systems Incorporated and its
  ~ suppliers and are protected by trade secret or copyright law.
  ~ Dissemination of this information or reproduction of this material
  ~ is strictly forbidden unless prior written permission is obtained
  ~ from Adobe Systems Incorporated.
  --%>

<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideUtils" %>
<%
    Boolean isEmbedded = GuideUtils.embedFragmentResources(resource, request.getParameter("fragmentPath"), "true".equals(request.getParameter("processConversion")));
    response.setContentType("application/json; charset=UTF-8");
    out.println("{\"isEmbedded\" : " + isEmbedded + "}");
%>
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
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@ page import="com.adobe.aemds.guide.service.GuideModelImporter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
<%@ page import="org.apache.sling.commons.json.JSONArray" %>
<%
    GuideModelImporter guidemodelimporter = sling.getService(GuideModelImporter.class);
    List<String> lazyChildren = guidemodelimporter.getLazyChildren(resource);
    response.setContentType("application/json; charset=UTF-8");
    out.println(new JSONArray(lazyChildren));
%>
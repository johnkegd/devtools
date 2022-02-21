<%--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * ADOBE CONFIDENTIAL
 * __________________
 *
 *  Copyright 2015 Adobe Systems Incorporated
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.service.GuideModelTransformer" %>
<%@ page import="com.adobe.aemds.guide.transformer.impl.AdaptiveFormResourcePropertyTransformer" %>
<%
    GuideModelTransformer guideModelTransformer = sling.getService(GuideModelTransformer.class);
    response.setContentType("application/json; charset=UTF-8");
    Resource newresource = slingRequest.getResourceResolver().getResource(request.getParameter("path"));
    //NOCHECKMARX - getAdaptiveFormTreeJSON doesn't has user input directly preventing Reflected XSS All Clients.
    out.println(guideModelTransformer.getAdaptiveFormTreeJSON(newresource,new AdaptiveFormResourcePropertyTransformer()));
%>
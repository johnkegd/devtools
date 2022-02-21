<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2019 Adobe Systems Incorporated
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
<%@ page import="com.adobe.aemds.guide.service.DoRBindRefService" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants" %>
<%@ page import="org.apache.sling.api.resource.ResourceResolver" %>
<%@ page import="org.apache.sling.api.resource.Resource" %>
<%@ page import="org.apache.sling.api.resource.ValueMap" %>
<%
    DoRBindRefService doRBindRefService = sling.getService(DoRBindRefService.class);
    response.setContentType("application/json; charset=UTF-8");
    ResourceResolver rr = slingRequest.getResourceResolver();
    String afPath = slingRequest.getPathInfo();
    // find dorTemplateRef from afpath and pass to the service.
    afPath = afPath.substring(0, afPath.lastIndexOf(".dorbindrefschema"));
    Resource guideContainerResource = rr.getResource(afPath);
    ValueMap propsMap = guideContainerResource.adaptTo(ValueMap.class);
    String pdfPath = propsMap.get(GuideConstants.DOR_TEMPLATE_REF, String.class);
    String dorString = doRBindRefService.getDoRBindRefs(rr, pdfPath);
    out.println(dorString);
%>
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
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@page import="com.adobe.aemds.guide.service.GuideLocalizationService" %>
<%@page import="org.apache.sling.commons.json.JSONObject" %>
<cq:defineObjects />
<%
    try {
        GuideLocalizationService guideLocalizationService = sling.getService(GuideLocalizationService.class);
        JSONObject json = guideLocalizationService.getAvailableLocales(resource);
        response.getWriter().write(json.toString().replaceAll("-","_"));
        response.setContentType("application/json");
    } catch (Exception e) {
        log.error("Failed to get existing locales.",e);
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
%>
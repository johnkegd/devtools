<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2014 Adobe Systems Incorporated
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
<%@page import="java.util.Arrays" %>
<%
    try {
        GuideLocalizationService guideLocalizationService = sling.getService(GuideLocalizationService.class);
        if("true".equals(request.getParameter("afUpdateDictionaryBaseName"))) {
            guideLocalizationService.updateDictionaryBaseName(resource);
        }
        else {
            response.setContentType("text/plain; charset=UTF-8");
            String[] locales = request.getParameterValues("locales");
            if (locales != null) {
                JSONObject json = guideLocalizationService.createDictionaryWithFragmentContent(resource,Arrays.asList(locales));
                response.getWriter().write(json.toString());
            } else {
                JSONObject json = guideLocalizationService.createDictionaryWithFragmentContent(resource);
                //NOCHECKMARX - json doesn't has user input preventing Reflected XSS All Clients.
                response.getWriter().write(json.toString());
            }
        }
    } catch (Exception E) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
%>
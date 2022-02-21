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
<%--
  ==============================================================================

  Global Guides Global Script

  This script can be used by any other script in order to get the default
  guide tag libs and guide objects defined

  @note: This script should be include only after inclusion of libs/foundation/global.jsp

  the following page context attributes are initialized via the <cq:defineObjects/>
  tag:

    @param slingRequest SlingHttpServletRequest
    @param slingResponse SlingHttpServletResponse


  ==============================================================================

--%><%@page session="false" import="com.adobe.aemds.guide.utils.NodeStructureUtils,
        com.adobe.aemds.guide.utils.GuideConstants,
        com.adobe.aemds.guide.taglibs.GuideELUtils,
        com.adobe.aemds.guide.common.*,
        com.day.cq.wcm.api.WCMMode,
        com.adobe.aemds.guide.service.GuideException,
        com.day.cq.i18n.I18n,
        com.adobe.granite.ui.clientlibs.HtmlLibraryManager,
        java.util.Iterator,
        java.util.ArrayList,
        org.apache.sling.api.resource.Resource,
        org.apache.sling.api.resource.ResourceUtil,
        java.util.Map,
        java.util.Locale"
%>
<%@include file="/libs/foundation/global.jsp"%>
<%@taglib prefix="guide" uri="http://www.adobe.com/taglibs/guides/2.0"%>
<%@taglib prefix="ui" uri="http://www.adobe.com/taglibs/granite/ui/1.0" %>
<%@page import="com.day.cq.wcm.api.AuthoringUIMode" %>
<c:choose>
    <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC || WCMMode.fromRequest(request) == WCMMode.DISABLED%>">
        <c:set var="isEditMode" scope="page" value="<%=(WCMMode.fromRequest(request) == WCMMode.EDIT  || WCMMode.fromRequest(request)== WCMMode.DESIGN)%>"/>
        <c:set var="isPreviewMode" scope="page"
               value="<%=(WCMMode.fromRequest(request) == WCMMode.PREVIEW || WCMMode.fromRequest(request) == WCMMode.DISABLED)%>"/>
    </c:when>
    <c:otherwise>
        <c:set var="isEditMode" scope="page" value="<%=((slingRequest.getParameter("editmode") != null && Boolean.parseBoolean(slingRequest.getParameter("editmode")) == true) || (slingRequest.getParameter("editmode") == null && ( WCMMode.fromRequest(request) != WCMMode.PREVIEW && WCMMode.fromRequest(request) != WCMMode.DISABLED )))%>"/>
        <c:set var="isPreviewMode" scope="page" value="<%=(Boolean.parseBoolean(slingRequest.getParameter("editmode")) == false || ( slingRequest.getParameter("editmode") == null && (WCMMode.fromRequest(request) == WCMMode.PREVIEW || WCMMode.fromRequest(request) == WCMMode.DISABLED) ))%>"/>
    </c:otherwise>
</c:choose>
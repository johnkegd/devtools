<%--
  ~ ************************************************************************
  ~ ADOBE CONFIDENTIAL
  ~ __________________
  ~
  ~ Copyright 2016 Adobe Systems Incorporated
  ~ All Rights Reserved.
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
  ~ ************************************************************************
  --%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.utils.GuideUtils" %>
<head>
    <title><%= currentPage.getTitle() == null ? xssAPI.encodeForHTML(currentPage.getName()) : xssAPI.encodeForHTML(currentPage.getTitle()) %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <cq:include script="/libs/wcm/core/components/init/init.jsp" />
    <c:if test="${isEditMode || isPreviewMode}">
        <cq:include script="/libs/wcm/mobile/components/simulator/simulator.jsp"/>
    </c:if>

    <%-- Adobe Target relevant clientlibs: --%>
    <c:if test="<%=GuideUtils.isAdobeTargetConfigured(resource)%>">
         <sling:include path="contexthub" resourceType="granite/contexthub/components/contexthub"/>
         <%-- @TODO Remove cq.shared as this is a heavy library. Tracked via CQ-4219972 --%>
         <ui:includeClientLib categories="cq.shared"/>
         <cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
    </c:if>

    <cq:include script="library.jsp"/>
</head>
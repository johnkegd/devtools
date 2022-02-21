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
  Guide Panel Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@page import="com.adobe.aemds.guide.taglibs.GuideELUtils" %>
<%@ page import="com.day.cq.wcm.api.components.ComponentContext" %>
<guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuidePanel" restoreOnExit="true">
    <cq:include path="items" resourceType ="${guidePanel.layoutPath}"/>
</guide:initializeBean>
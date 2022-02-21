<%------------------------------------------------------------------------
~
~ ADOBE CONFIDENTIAL
~ __________________
~
~  Copyright 2017 Adobe Systems Incorporated
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

    Script to keep common variables related to Guide Container component
    Following variables are defined in this jsp

     1. targetMode - Boolean to check if target mode is enabled or not
     2. isTouchAuthoring - Boolean to check if jsp is being rendered for Touch Authoring
  ==============================================================================
--%>
<%@ page import="com.day.cq.wcm.api.AuthoringUIMode,
                 com.adobe.aemds.guide.utils.GuideConstants" %>
<c:set var="targetMode" scope="page" value="<%="true".equals(request.getParameter(GuideConstants.TARGET_MODE))%>" />
<c:set var="isTouchAuthoring" scope="page" value="<%=AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.TOUCH%>" />
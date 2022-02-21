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
 <%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@page import="com.adobe.aemds.guide.taglibs.GuideELUtils,
                com.adobe.aemds.guide.utils.GuideConstants,
                org.apache.commons.lang3.StringUtils" %>
<guide:initializeBean name="guideToolbar" className="com.adobe.aemds.guide.common.GuideItemsContainer" restoreOnExit="true">
    <c:if test="${isEditMode}">
        <% // In author mode , we need /i18n/wcm/core and not our dictonary
            I18n i18n = new I18n(slingRequest.getResourceBundle(slingRequest.getLocale()));
            //Putting name on panel toolbar
            Node parentNode = currentNode.getParent();
            String panelName = "";
            String toolbarString = i18n.get("Toolbar for Panel : ");

            if (parentNode.hasProperty(GuideConstants.JCR_TITLE)) {
                panelName = parentNode.getProperty(GuideConstants.JCR_TITLE).getString();
            }

            if (StringUtils.isEmpty(panelName) && parentNode.hasProperty(GuideConstants.PROPERTY_NAME)) {
                panelName = parentNode.getProperty(GuideConstants.PROPERTY_NAME).getString();
            }

            GuideELUtils.setToolbarLabel(panelName, toolbarString, editContext, slingRequest);
        %>
        <c:if test="${fn:length(guideToolbar.items) eq 0}">
            <%-- Placeholder div for Empty Toolbar --%>
            <div class="cq-placeholder" data-emptytext="<%= toolbarString + panelName %>"></div>
        </c:if>
    </c:if>
    <div class="<%=GuideConstants.GUIDE_TOOLBAR%>Node ${guide:encodeForHtmlAttr(guideToolbar.name,xssAPI)} ${guide:encodeForHtmlAttr(guideToolbar.cssClassName,xssAPI)}"
        id="${guideToolbar.id}" data-guide-view-bind=${guideToolbar.id}  <c:if test="${fn:length(guideToolbar.items) eq 0}"> style="height:0px; margin:0px;" </c:if>>
        <cq:include path="items" resourceType="${guideToolbar.layoutPath}"/>
    </div>
</guide:initializeBean>
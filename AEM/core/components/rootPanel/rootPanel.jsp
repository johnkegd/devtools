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
<guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuidePanel"/>
<div class="guideRootPanel ${guide:encodeForHtmlAttr(guidePanel.name,xssAPI)} ${guide:encodeForHtmlAttr(guidePanel.cssClassName,xssAPI)}" id="${guidePanel.id}" data-path="${guidePanel.path}" data-guide-view-bind="${guidePanel.id}" <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guidePanel.authoringConfigJSON,xssAPI)}' </c:if> >
    <cq:include path="items" resourceType ="${guidePanel.layoutPath}"/>
</div>
<c:if test="${isEditMode}">
    <% //Putting name on panel toolbar
        // In author mode , we need /i18n/wcm/core and not our dictonary
        I18n i18n = new I18n(slingRequest.getResourceBundle(slingRequest.getLocale()));
        GuideELUtils.setToolbarLabel(properties.get("name", ""), i18n.get("Panel: "), editContext, slingRequest);
    %>
</c:if>
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
<c:if  test="${not empty guidePanel.longDescription}">
        <c:set var="panelTitle" value="${fn:trim(guidePanel.title)}" />
        <c:set var="panelName" value="${fn:trim(guidePanel.name)}" />
        <div class="<%=GuideConstants.GUIDE_HELP_QUESTIONMARK%>"
             data-guide-longDescription="${guidePanel.id}_<%=GuideConstants.GUIDE_PANEL_LONG_DESCRIPTION%>"
             tabindex="0"
             role="button"
             aria-label="${fn:length(panelTitle) eq 0 ? guide:encodeForHtmlAttr(panelName,xssAPI) : guide:encodeForHtmlAttr(panelTitle,xssAPI)} Help">
            <c:if test="${not empty guidePanel.questionMarkInlineStyles}">
                <style>
                    .guidePanelNode [data-guide-longDescription = "${guidePanel.id}_<%=GuideConstants.GUIDE_PANEL_LONG_DESCRIPTION%>"]:before {
                    ${guidePanel.questionMarkInlineStyles};
                    }
                </style>
            </c:if>
        </div>
    <div  id="${guidePanel.id}_<%=GuideConstants.GUIDE_PANEL_LONG_DESCRIPTION%>" class="<%=GuideConstants.GUIDE_PANEL_DESCRIPTION%> long" style="${guide:encodeForHtmlAttr(guidePanel.longDescriptionInlineStyles,xssAPI)}">${guidePanel.longDescription}</div>
</c:if>
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
<c:if test="${not empty guideField.longDescription}">
<c:set var="componentTitle" value="${fn:trim(guideField.title)}" />
<c:set var="componentName" value="${fn:trim(guideField.name)}" />
<div class="<%=GuideConstants.GUIDE_HELP_QUESTIONMARK%>"
     data-guide-longDescription="${guideField.id}_<%=GuideConstants.GUIDE_FIELD_LONG_DESCRIPTION%>"
     data-guide-alwaysShow="${guideField.descriptionVisibility}"
     tabindex="0"
     role="button"
     aria-label="${fn:length(componentTitle) eq 0 ? guide:encodeForHtmlAttr(componentName,xssAPI) : guide:encodeForHtmlAttr(componentTitle,xssAPI)} Help">
    <c:if test="${not empty guideField.questionMarkInlineStyles}">
        <style>
            .guideFieldNode [data-guide-longDescription = "${guideField.id}_<%=GuideConstants.GUIDE_FIELD_LONG_DESCRIPTION%>"]:before {
            ${guideField.questionMarkInlineStyles};
            }
        </style>
    </c:if>
    ${guide:encodeForHtml(guideField.helpIndicatorContent,xssAPI)}
</div>
</c:if>
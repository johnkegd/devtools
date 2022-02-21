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
For guideTextDraw component, guideStaticText class is added.
For components extending guidetextdraw component (eg., adobeSignBlock), guideTextDraw class is added.
This prevents applying of Field styles on components extending guidetextdraw component, via theme.
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<cq:include script="init.jsp"/>
<%GuideTextDraw guideField =(GuideTextDraw) request.getAttribute("guideField");%>
<c:set var="guideid" scope="request" value="${guideField.id}" />
<div
    <c:choose>
        <c:when test="${guideField.guideFieldType eq 'guideTextDraw'}">
            class="<%=GuideConstants.GUIDE_FIELD%>Node  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guideField.name,xssAPI)} ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)} <%= GuideConstants.GUIDE_STATIC_TEXT %>"
        </c:when>
        <c:otherwise>
            class="<%=GuideConstants.GUIDE_FIELD%>Node  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guideField.name,xssAPI)} ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)} <%= GuideConstants.GUIDE_FIELD_TEXTDRAW %>"
        </c:otherwise>
    </c:choose>
     id="${guideid}" style="${guide:encodeForHtmlAttr(guideField.styles,xssAPI)};${guide:encodeForHtmlAttr(guideField.fieldInlineStyles,xssAPI)}" data-guide-view-bind="${guideid}"
     <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideField.authoringConfigJSON,xssAPI)}' </c:if> >
    <cq:include script="content.jsp"/>
</div>
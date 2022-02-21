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
<%@page session="false"%><%--
  Image component
  Draws an image.
--%><%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.day.cq.commons.Doctype,
    com.day.cq.commons.Externalizer,
    com.day.cq.wcm.api.components.DropTarget,com.day.cq.wcm.api.AuthoringUIMode"
%>
<cq:include script="init.jsp"/>
<c:set var="guideid" scope="request" value="${guideImage.id}" />
<sling:defineObjects /><%
    Externalizer externalizer = resourceResolver.adaptTo(Externalizer.class);
	String placeholderImage = externalizer.relativeLink(slingRequest, GuideConstants.GUIDE_IMAGE_ICON_PATH);
%>
<div id="${guideid}" data-guide-view-bind="${guideid}"
    <c:if test="${isEditMode}">
        data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideImage.authoringConfigJSON,xssAPI)}'
    </c:if>
    <c:choose>
        <c:when test="${(!isEditMode) || (not empty guideImage.imageSrc)}">
            class="${guideImage.guideFieldType} ${guide:encodeForHtmlAttr(guideImage.name,xssAPI)} ${guide:encodeForHtmlAttr(guideImage.cssClassName,xssAPI)}" style="${guide:encodeForHtmlAttr(guideImage.styles,xssAPI)}" >
            <c:choose>
                <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC %>" >
                    <img src="${guide:encodeForHtmlAttr(guideImage.imageSrc,xssAPI)}" alt="${guide:encodeForHtmlAttr(guideImage.altText,xssAPI)}" style="${guide:encodeForHtmlAttr(guideImage.fieldInlineStyles,xssAPI)}"/>
                </c:when>
                <c:otherwise>
                    <c:if test="${(not empty guideImage.imageSrc) || (not empty guideImage.bindRef)}">
                        <img src="${guide:encodeForHtmlAttr(guideImage.imageSrc,xssAPI)}" class="${guide:encodeForHtmlAttr(guideImage.dropTargetClass,xssAPI)}" alt="${guide:encodeForHtmlAttr(guideImage.altText,xssAPI)}" style="${guide:encodeForHtmlAttr(guideImage.fieldInlineStyles,xssAPI)}"/>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <c:if test="${isEditMode}">
                <c:choose>
                    <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC %>" >
                        class="${guideImage.guideFieldType} ${guide:encodeForHtmlAttr(guideImage.name,xssAPI)} ${guide:encodeForHtmlAttr(guideImage.cssClassName,xssAPI)}" style="${guide:encodeForHtmlAttr(guideImage.styles,xssAPI)}" >
                        <img src="<%=placeholderImage%>" alt="${guide:encodeForHtmlAttr(guideImage.altText,xssAPI)}" style="${guide:encodeForHtmlAttr(guideImage.fieldInlineStyles,xssAPI)}"/>
                    </c:when>
                    <c:otherwise>
                        class="guideImageEmpty ${guide:encodeForHtmlAttr(guideImage.dropTargetClass,xssAPI)} ${guide:encodeForHtmlAttr(guideImage.name,xssAPI)}" data-emptytext="Image">
                    </c:otherwise>
                </c:choose>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

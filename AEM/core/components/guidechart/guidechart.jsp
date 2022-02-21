<%--
  ~ ************************************************************************
  ~ ADOBE CONFIDENTIAL
  ~ __________________
  ~
  ~ Copyright 2015 Adobe Systems Incorporated
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
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants,
    com.day.cq.commons.Externalizer" %>
<%-- Chart Component --%>
<cq:include script="init.jsp"/>
<c:set var="guideid" scope="request" value="${guideField.id}"/>
<%-- Generating name explicitly. This variable is not used, but it creates a name property in repository in first render --%>
<c:set var="guidename" scope="request" value="${guideField.name}"/>
<sling:defineObjects /><%
    Externalizer externalizer = resourceResolver.adaptTo(Externalizer.class);
	String placeholderImage = externalizer.relativeLink(slingRequest, GuideConstants.GUIDE_CHART_ICON_PATH);
	String chartImage =  externalizer.relativeLink(slingRequest, GuideConstants.GUIDE_CHART_TYPE_THUMBNAIL_PATH_PREFIX + ((GuideChart)request.getAttribute("guideField")).getChartType() + GuideConstants.GUIDE_CHART_TYPE_THUMBNAIL_PATH_SUFFIX);
%>
<div id="${guideid}" data-guide-view-bind="${guideid}"
    <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideField.authoringConfigJSON,xssAPI)}' </c:if>
    <c:choose>
        <c:when test="${isEditMode}">
            <c:choose>
                <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC %>">
                    class="<%=GuideConstants.GUIDE_FIELD_NODE%>  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guidename,xssAPI)} ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)}" >
                    <img tabindex="0" src="<%=placeholderImage%>" alt="${guide:encodeForHtmlAttr(guideField.authoringAltText,xssAPI)}"/>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${guideField.chartType != null}">
                            class="<%=GuideConstants.GUIDE_FIELD_NODE%>  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guidename,xssAPI)} ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)} guideChartPlaceholderImage" >
                            <img tabindex="0" src="<%=chartImage%>" alt="${guide:encodeForHtmlAttr(guideField.authoringAltText,xssAPI)}" height="100%"/>
                        </c:when>
                        <c:otherwise>
                            class="guideChartEmpty cq-placeholder" data-emptytext="Chart">
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
             </c:choose>
        </c:when>
        <c:otherwise>
            class="<%=GuideConstants.GUIDE_FIELD%>Node  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guidename,xssAPI)} ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)}" >
            <%-- change the client library af.d3v3 so it embeds granite.dv-3.x.embedded, once typekit usage is
             stopped in the main library existing at /libs/granite/datavisualization/clientlibs/dv-3.x --%>
             <cq:include script="includeLibrary.jsp"/>
        </c:otherwise>
    </c:choose>
</div>
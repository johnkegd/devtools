<%@ page import="com.day.cq.wcm.api.components.ComponentContext,
    com.day.cq.wcm.api.AuthoringUIMode" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
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
<cq:include script="init.jsp"/>
<c:set var="guideid" scope="request" value="${guideField.id}" />
<div class="<%=GuideConstants.GUIDE_FIELD%>Node  ${guideField.guideFieldType} ${guide:encodeForHtmlAttr(guideField.name,xssAPI)}
            ${guide:encodeForHtmlAttr(guideField.cssClassName,xssAPI)} ${guideField.fieldLayoutName}" id="${guideid}"
     data-guide-view-bind="${guideid}" style="${guide:encodeForHtmlAttr(guideField.fieldInlineStyles,xssAPI)}"
        <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideField.authoringConfigJSON,xssAPI)}'
            <c:if test="${guideField.errorSimulatorString != null}">
                data-hasValidation='true'
            </c:if>
            <c:if test="${guideField.mandatory}">
                data-mandatory='true'
            </c:if>
        </c:if>>
    <c:choose>
        <%-- Ask the renderer for rendition of field  --%>
        <%-- Condition written to support backward compatibility --%>
        <c:when test="${guideField.isOldFieldLayout}">
            <cq:include script="${guideField.fieldLayout}"/>
        </c:when>
        <c:otherwise>
            <cq:include path="${guideField.path}" resourceType="${guideField.fieldLayout}"/>
        </c:otherwise>
    </c:choose>
    <c:if test="${isEditMode}">
        <%-- In edit mode, we show the invalid indicator --%>
        <c:set var="bindReference" value="data-xdp-som='${guideField.bindRef}'" />
        <div class="alert_indicator ${guideField.valid ? "guidevalid_indicator" : "guideinvalid_indicator"}"
            ${not empty guideField.bindRef ? bindReference : ""}
             data-guide-name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}"
             data-guide-error="${guide:encodeForHtmlAttr(guideField.error,xssAPI)}"
             data-guide-path="${guideField.path}"
             data-guide-id="${guideField.id}">
        </div>
    </c:if>
</div>
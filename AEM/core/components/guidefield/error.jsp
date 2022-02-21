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
<%@page import="com.adobe.aemds.guide.utils.GuideThemeUtils" %>
<div class="<%=GuideConstants.GUIDE_FIELD_ERROR%>"  id="${guideField.labelForId}_desc">
    <c:if test="${isEditMode}">
        <c:if test="${guideField.errorSimulatorString != null}">
            ${guide:filterHtml(guideField.errorSimulatorString,xssAPI)}
        </c:if>
    </c:if>
</div>
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
<c:if  test="${not empty guideField.shortDescription}">
<div id="${guideField.id}_<%=GuideConstants.GUIDE_FIELD_SHORT_DESCRIPTION%>" class="<%=GuideConstants.GUIDE_FIELD_DESCRIPTION%> short" style="${guide:encodeForHtmlAttr(guideField.shortDescriptionInlineStyles,xssAPI)}" >
    ${guide:filterHtml(guideField.shortDescription,xssAPI)}
</div>
</c:if>
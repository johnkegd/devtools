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
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<c:if test="${guideField.hideTitle eq false}">
    <div class="<%=GuideConstants.GUIDE_FIELD_LABEL%> top"
         style="${guide:encodeForHtmlAttr(guideField.captionInlineStyles,xssAPI)}"><label for="${guideField.labelForId}" id="${guideid}_label">${guide:encodeForHtml(guideField.title,xssAPI)}</label></div>
         <%-- above code has been written in one-line intentionally. Don't indent it as it breaks inline editing of title --%>
</c:if>
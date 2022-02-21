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
  File Upload Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<div class="<%= GuideConstants.GUIDE_FIELD_WIDGET%> afFileUpload" style="${guideField.styles}">
    <input id="${guideid}${'_widget'}"  name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}" type="file" accept="${guideField.mimeType}" tabindex="-1" style="" aria-describedby="${guideField.labelForId}_desc" <c:if test="${guideField.multiSelection}"> multiple</c:if> />
    <button class="button-default button-medium guide-fu-attach-button" type="button" style="${guide:encodeForHtmlAttr(guideField.widgetInlineStyles,xssAPI)}">${guide:encodeForHtmlAttr(guideField.buttonText,xssAPI)}</button>
    <ul class="guide-fu-fileItemList"></ul>
</div>
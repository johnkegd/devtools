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
 ~ from Adobe Systems Incorporaed.
 --------------------------------------------------------------------------%>
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants" %>
<%--
  Button Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%GuideNode guideField =(GuideNode) request.getAttribute("guideField");%>
<div class="<%= GuideConstants.GUIDE_FIELD_WIDGET%> <%= GuideConstants.GUIDE_FIELD_BUTTON_WIDGET%>" style="${guide:encodeForHtmlAttr(guideField.styles,xssAPI)}">
    <button class="${guideField.buttonType} ${guideField.buttonSize} ${guideField.type}" type= ${guideField.type == "submit" ? "submit" : "button"} id="${guideid}${'_widget'}" name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}" style="${guide:encodeForHtmlAttr(guideField.widgetInlineStyles,xssAPI)}">
        <span class="iconButton-icon"></span>
        <span class="iconButton-label" data-guide-button-label="true" style="${guide:encodeForHtmlAttr(guideField.captionInlineStyles,xssAPI)}">${guide:encodeForHtml(guideField.title,xssAPI)}</span>
    </button>
    <%-- End of Widget Div --%>
</div>
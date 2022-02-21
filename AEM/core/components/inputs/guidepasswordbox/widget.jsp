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
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants" %>
<%--
  NumericBox Component
--%>
    <%-- todo: In case of repeatable panels, please change this logic at view layer --%>
    <div class="<%= GuideConstants.GUIDE_FIELD_WIDGET%> defaultWidget" style="${guide:encodeForHtmlAttr(guideField.styles,xssAPI)}">
                 <input type="password" id="${guideid}${'_widget'}" name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}" aria-describedby="${guideField.labelForId}_desc"
                    style="${guide:encodeForHtmlAttr(guideField.widgetInlineStyles,xssAPI)}" placeholder="${guide:encodeForHtmlAttr(guideField.placeholderText,xssAPI)}"/>
        <%-- End of Widget Div --%>
    </div>
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
  DropDown List Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%-- Widget Div --%>
<%-- todo: In case of repeatable panels, please change this logic at view layer --%>
<div class="<%= GuideConstants.GUIDE_FIELD_WIDGET%> dateTimeEdit" style="${guide:encodeForHtmlAttr(guideField.styles,xssAPI)}">
    <c:choose>
        <c:when test="${isEditMode}">
            <div style="position:relative;height:100%">
                <input type="text" id="${guideid}${"_widget"}" name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}"
                       value="${guide:encodeForHtmlAttr(guideField.value,xssAPI)}" style="${guide:encodeForHtml(guideField.widgetInlineStyles,xssAPI)}"
                       placeholder="${guide:encodeForHtmlAttr(guideField.placeholderText,xssAPI)}"
                       aria-describedby="${guideField.labelForId}_desc"/>
                <div class="datepicker-calendar-icon"></div>
            </div>
        </c:when>
        <c:otherwise>
            <input type="date" id="${guideid}${"_widget"}" name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}"
                   value="${guide:encodeForHtmlAttr(guideField.value,xssAPI)}" style="${guide:encodeForHtmlAttr(guideField.widgetInlineStyles,xssAPI)}"
                   min="${guide:encodeForHtmlAttr(guideField.minimumDate,xssAPI)}"
                   max="${guide:encodeForHtmlAttr(guideField.maximumDate,xssAPI)}"
                   aria-describedby="${guideField.labelForId}_desc"/>
        </c:otherwise>
    </c:choose>
    <%-- End of Widget Div --%>
</div>
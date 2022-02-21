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
<hr class="${guideSeparator.guideFieldType} ${guide:encodeForHtmlAttr(guideSeparator.name,xssAPI)}
            ${guide:encodeForHtmlAttr(guideSeparator.cssClassName,xssAPI)}"
     id="${guideSeparator.id}"
     style="border-bottom-width:${guide:encodeForHtmlAttr(guideSeparator.thickness,xssAPI)}px;
      ${guide:encodeForHtmlAttr(guideSeparator.fieldInlineStyles,xssAPI)};"
    <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideSeparator.authoringConfigJSON,xssAPI)}' </c:if> />
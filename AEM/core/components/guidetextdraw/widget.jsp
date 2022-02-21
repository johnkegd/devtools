<%--
  ~
  ~ ADOBE CONFIDENTIAL
  ~ ___________________
  ~
  ~ Copyright 2017 Adobe Systems Incorporated
  ~ All Rights Reserved.
  ~
  ~ NOTICE:  All information contained herein is, and remains
  ~ the property of Adobe Systems Incorporated and its suppliers,
  ~ if any.  The intellectual and technical concepts contained
  ~ herein are proprietary to Adobe Systems Incorporated and its
  ~ suppliers and are protected by trade secret or copyright law.
  ~ Dissemination of this information or reproduction of this material
  ~ is strictly forbidden unless prior written permission is obtained
  ~ from Adobe Systems Incorporated.
  --%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
${guideField.value}
<c:if test="${isEditMode}">
    <c:set var="bindReference" value="data-xdp-som='${guide:encodeForHtmlAttr(guideField.bindRef,xssAPI)}'" />
    <div class="alert_indicator ${guideField.valid ? "guidevalid_indicator" : "guideinvalid_indicator"}"
        ${not empty guideField.bindRef ? bindReference : ""}
         data-guide-name="${guide:encodeForHtmlAttr(guideField.name,xssAPI)}"
         data-guide-error="${guide:encodeForHtmlAttr(guideField.error,xssAPI)}"
         data-guide-path="${guideField.path}"
         data-guide-id="${guideField.id}">
    </div>
</c:if>
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
<%@page session="false"%>
<%@page import="com.day.cq.i18n.I18n" %>
<%
    I18n i18n = new I18n(slingRequest);
%>
<%--
  Terms and conditions component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<c:set var="index" value="0" scope="page"/>
<div class="<%= GuideConstants.GUIDE_FIELD_WIDGET%> afTermsAndConditions" style="${guide:encodeForHtmlAttr(guideField.styles,xssAPI)}">
    <c:choose>
        <c:when test="${guideField.showAsPopUp}">

            <div id="tncDialog_${guideField.id}" class="guide-modal guide-fade" tabindex="-1" role="dialog" aria-labelledby="tncDialog" aria-hidden="true">
                <div class="guide-modal-dialog">
                    <div class="guide-modal-content">
                        <div class="guide-modal-header">
                            <a href="#" class="guide-close" data-dismiss="modal">X</a>
                            <h3><%= i18n.get("Please review the terms and conditions") %></h3>
                        </div>
                        <div class="guide-modal-body afTncContentArea">
                            <c:choose>
                                <c:when test="${guideField.showLink}">
                                    <div class="guide-tnc-link">
                                        <c:forEach items="${guideField.linkText}" var="linkText">
                                            <div class="row">
                                                <c:set var="splittedLinkText" value="${fn:split(linkText, '=')}" />
                                                <a class="guide-tnc-document-unvisited" href="${splittedLinkText[1]}" target="_blank">${guide:encodeForHtml(splittedLinkText[0],xssAPI)}</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                        <div class="guide-tnc-content" style="${guide:encodeForHtmlAttr(guideField.fieldInlineStyles,xssAPI)}">${guideField.tncTextContent}</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </c:when>

        <c:otherwise>
            <c:choose>
                <c:when test="${guideField.showLink}">
                    <div tabindex="0">
                        <div class="guide-sr-only guide-tnc-sr-only">${guide:encodeForHtml(guideField.screenReaderText,xssAPI)}</div>
                        <div class="guide-tnc-link">
                            <c:forEach items="${guideField.linkText}" var="linkText">
                                <div class="row">
                                    <c:set var="splittedLinkText" value="${fn:split(linkText, '=')}" />
                                    <a class="guide-tnc-document-unvisited" href="${splittedLinkText[1]}" target="_blank">${guide:encodeForHtml(splittedLinkText[0],xssAPI)}</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div tabindex="0" class="afTncContentArea">
                        <div class="guide-sr-only guide-tnc-sr-only">${guide:encodeForHtml(guideField.screenReaderText,xssAPI)}</div>
                        <div class="guide-tnc-content" style="${guide:encodeForHtmlAttr(guideField.widgetInlineStyles,xssAPI)}">${guide:filterHtml(guideField.tncTextContent,xssAPI)}</div>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:otherwise>
    </c:choose>

    <c:if test="${guideField.showApprovalOption}">
        <div class="guide-tnc-checkbox guide-tnc-checkbox-disabled">
            <c:choose>
                <c:when test="${guideField.showAsPopUp}">
                    <div class="guide-tnc-checkboxwidget left">
                        <input type="checkbox" disabled="disabled" aria-label="${guideField.screenReaderText}${guide:encodeForHtmlAttr(guideField.tncCheckBoxContent,xssAPI)}" id="${guideField.id}_tncCheckBox" aria-describedby="${guideField.labelForId}_desc"/>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="guide-tnc-checkboxwidget left">
                        <input type="checkbox" disabled="disabled" id="${guideField.id}_tncCheckBox" aria-describedby="${guideField.labelForId}_desc"
                               aria-label="${guide:encodeForHtmlAttr(guideField.tncCheckBoxContent,xssAPI)}" />
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="guideWidgetLabel right">
                <c:choose>
                    <c:when test="${guideField.showAsPopUp}">

                        <label for="${guideField.id}_tncCheckBox"><a data-toggle="modal" aria-label="<%=i18n.get("Press Enter for reading Terms and Conditions")%>" class="guide-tnc-document-unvisited" href="#tncDialog_${guideField.id}">${guide:encodeForHtml(guideField.tncCheckBoxContent,xssAPI)}</a></label>
                    </c:when>
                    <c:otherwise>
                        <label for="${guideField.id}_tncCheckBox">
                                ${guide:encodeForHtml(guideField.tncCheckBoxContent,xssAPI)}
                        </label>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:if>
</div>
<script>
    $(function(){
        guidelib.util.GuideUtil.adjustElementHeight("${guideField.id}", ${guideField.showAsPopUp});
    });
</script>
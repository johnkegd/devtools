<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
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
  Guide Table Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@page import="com.adobe.aemds.guide.taglibs.GuideELUtils,
                com.day.cq.wcm.api.components.IncludeOptions" %>
<guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuideTable" restoreOnExit="true">
<%
    GuideTable guidePanel = (GuideTable)request.getAttribute("guidePanel");
    String dataEditPath = guidePanel.getIsEditMode() ? "data-editpath=\"" + guidePanel.getPath() + "\"" : "";
    request.setAttribute("mobileLayout", (guidePanel.getMobileLayout()));
%>
<%-- Wrapper Div --%>
<div <%=dataEditPath%> class="<%=GuideConstants.GUIDE_TABLE%>Node ${guide:encodeForHtmlAttr(guidePanel.name,xssAPI)} ${guide:encodeForHtmlAttr(guidePanel.cssClassName,xssAPI)}"
    id="${guidePanel.id}" style="${guide:encodeForHtmlAttr(guidePanel.styles,xssAPI)};${guide:encodeForHtmlAttr(guidePanel.fieldInlineStyles,xssAPI)};" data-guide-view-bind=${guidePanel.id}
        <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guidePanel.authoringConfigJSON,xssAPI)}' </c:if> >
        <%-- Include all the child items here   --%>
        <cq:include path="items" resourceType ="${guidePanel.layoutPath}"/>
</div>
<c:if test="${isEditMode}">
    <%  //Putting name on table toolbar
        // In author mode , we need /i18n/wcm/core and not our dictonary
        I18n i18n= new I18n(slingRequest.getResourceBundle(slingRequest.getLocale()));
        GuideELUtils.setToolbarLabel(properties.get("name", ""), i18n.get("Table: "), editContext, slingRequest);
    %>
</c:if>
</guide:initializeBean>
<c:if test="${isEditMode}">
    <c:if test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
        <script>
            $(function(){
                guidelib.author.AuthorUtils.GuideTableEdit.hideTableCellContextMenuOptions();
            });
        </script>
    </c:if>
</c:if>
<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2015 Adobe Systems Incorporated
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
<guide:initializeBean name="guideContainer" className="com.adobe.aemds.guide.common.GuideContainer" />
<div id="actionField">
    <input type="hidden" id=":redirect" name=":redirect" value="${guide:encodeForHtmlAttr(guideContainer.redirect,xssAPI)}"/>
        <input type="hidden" id=":selfUrl" name=":selfUrl" value="<%= ((currentPage != null) ? currentPage.getPath() : "")%>"/>
	<guide:guideStart/>
    <c:forEach items="${guideContainer.guideIntegrationServiceScriptPaths}" var="currentPath">
            <c:if test="${not empty currentPath}">
                <cq:include script="${currentPath}"/>
            </c:if>
        </c:forEach>
</div>
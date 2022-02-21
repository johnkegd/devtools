<%--
  ~ ************************************************************************
  ~ ADOBE CONFIDENTIAL
  ~ __________________
  ~
  ~ Copyright 2016 Adobe Systems Incorporated
  ~ All Rights Reserved.
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
  ~ ************************************************************************
  --%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@include file="/libs/fd/af/components/guideContainer/commonVars.jsp" %>
<%@ page import="com.adobe.aemds.guide.themes.GuideThemeConstants,
                 org.apache.commons.lang3.StringUtils,
			     com.adobe.aemds.guide.utils.GuideThemeUtils,
			     com.adobe.aemds.guide.utils.GuideUtils,
				 com.adobe.aemds.guide.service.GuideThemeService" %>
<%@ page import="com.adobe.aemds.guide.utils.ThemeClientLibData" %>
    <%
        String themeOverride = request.getParameter(GuideThemeConstants.PARAMETER_THEME_OVERRIDE);
        if(StringUtils.isBlank(themeOverride)){
            themeOverride = (String) request.getAttribute(GuideThemeConstants.PARAMETER_THEME_OVERRIDE);
        }
        else{
            //We are appending "jcr:content" because 'themeOverride' parameter gives path to theme resource and not it's content resource
            themeOverride += GuideThemeConstants.RELATIVE_PATH_JCR_CONTENT;
        }
        String pageFallbackClientlib = (String) request.getAttribute(GuideConstants.PAGE_FALLBACK_CLIENTLIB_CATEGORY);
        ThemeClientLibData clientLibData = GuideThemeUtils.getClientLibNames(resource, themeOverride, pageFallbackClientlib);
        if(clientLibData.getCommonClientLib() != null) {%>
            <ui:includeClientLib  css="<%=clientLibData.getCommonClientLib()%>"/>
        <%} %>
        <div id="fdtheme-id-clientlibs">
        <%
        if(clientLibData.getThemeClientLib() != null) { %>
            <ui:includeClientLib css="<%=clientLibData.getThemeClientLib()%>"/>
        <%} %>
        </div>
        <div id="fd-webfont-include">
            <%
                String themeContentPath = (StringUtils.isEmpty(themeOverride) ? GuideUtils.getThemeContentRef(resource) : themeOverride);
                if(StringUtils.isNotEmpty(themeContentPath) && GuideThemeUtils.getWebFontConfig(resourceResolver, themeContentPath) != null) {
            %>      <c:if test="${!isEditMode && !targetMode && !isTouchAuthoring}">
                        <script>
                            <%-- Set timeout of 3 secs for showing loading icon until web fonts are loaded--%>
                            $("#loadingPage").addClass("guide-wf-loading");
                            setTimeout(function () {
                                $("#loadingPage").removeClass("guide-wf-loading");
                            }, 3000);
                        </script>
                    </c:if>
            <%      Resource formResource = resource.getParent();
                    String formPath = (formResource != null ? formResource.getPath() : "");
                    GuideThemeService themeService = sling.getService(GuideThemeService.class);
                    String scriptCode = themeService.getEmbeddingCode(themeContentPath, formPath);
                    out.println(scriptCode);
                }
            %>
        </div>
<c:if test="${isEditMode}">
    <%-- css for the various selector elements --%>
    <div id="themeIntegrationElement"></div>
    <%-- css for the raw css of elements --%>
    <style id="styleRawCss"></style>
    <%-- css for the highlighting of elements whose property sheet is opened--%>
    <style id="overlayFieldsHighlight">.overlayFieldsHighlight{outline: 2px solid #46C8DC;outline-offset: 1px;}</style>
</c:if>
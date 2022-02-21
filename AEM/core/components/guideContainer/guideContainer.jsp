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
<%@include file="/libs/fd/af/components/guidesglobal.jsp" %>
<%@include file="/libs/fd/af/components/guideContainer/commonVars.jsp" %>
<%-- Need to sync client libs include and script with progressiveDataCapture.html --%>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@ page import="java.util.List,
                 java.util.UUID,
                 org.apache.jackrabbit.api.security.user.UserManager,
                 org.apache.sling.commons.json.JSONObject,
                 org.apache.sling.api.resource.ResourceResolver,
                 com.day.cq.wcm.api.AuthoringUIMode,
                 com.day.cq.wcm.api.Template,
                 com.adobe.aemds.guide.service.AdaptiveFormConfigurationService,
                 com.adobe.aemds.guide.service.internal.PageStyleService,
                 com.adobe.aemds.guide.utils.GuideContainerThreadLocal,
                 com.adobe.aemds.guide.utils.GuideUtils,
                 com.adobe.aemds.guide.utils.GuideConstants" %>
<cq:include script="allowedComponents.html"/>
<%
    // todo: this logic has to change later
    // Please Note: This logic is done to support AB Testing with forms created from editable templates
    // get the page's template and check if it has structure support
    Template template = resourcePage != null ? resourcePage.getTemplate() : null;
    // if the form is not yet rendered, lets render it
    if(template != null && template.hasStructureSupport() && request.getAttribute("formCreatedFromEditableTemplateRendered") == null) {
        // set the rendered attribute and include the guide container
        request.setAttribute("formCreatedFromEditableTemplateRendered", true);
%>
<guide:includeGuideContainer/>
<%
     } else {
%>
<guide:initializeBean name="guideContainer" className="com.adobe.aemds.guide.common.GuideContainer" />
<c:set var="hasXDP" value="false" />
<c:set var="hasXSD" value="false" />
<%-- NOCHECKMARX - targetMode will be evaluated to boolean always preventing Reflected XSS All Clients. --%>
<c:set var="targetEnabled" value="<%=GuideUtils.isTargetEnabled(resource)%>" />
<%-- Note: Loading icon not required in Edit (Classic + Touch) + Preview in Touch + Target Mode --%>
<div id="loadingPage" <c:if test="${!isEditMode && !targetMode && !isTouchAuthoring}"> class="guideLoading" </c:if>></div>
<c:if test="${not empty guideContainer.xdpRef}">
    <c:set var="hasXDP" value="true" />
</c:if>
<c:if test="${not empty guideContainer.xsdRef}">
    <c:set var="hasXSD" value="true" />
</c:if>
<c:set var="guideClientLibRef" value="${guideContainer.clientLibRef}" />
<%-- This ensures that all customer templates with height:100% set at body tag
  works OOTB in touch. This is done since there is height calculation at iframe tag in touch. Refer to CQ-70350 for more info --%>
<c:if test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.TOUCH%>">
    <style>
        html, body {
            height: auto !important;
        }
    </style>
</c:if>
<%
    String logConfig = request.getParameter("logConfig");
    if (logConfig != null) {
%>
<script>
    window.AF_log_config = '<%=GuideELUtils.encodeForHtml(logConfig.replace("\\", "\\\\").replace("'","\\'"), xssAPI)%>';
</script>
<%
    }
%>
<%-- The attribute guideContainerPath is used by forms manager to get the container path
      refer to use of guideContainer.guideIntegrationServiceScriptPaths by Forms Manager  --%>
<%
    pageContext.setAttribute("guideContainerPath",resource.getPath(),PageContext.REQUEST_SCOPE);
    String locale=GuideUtils.getAcceptLang(slingRequest);
    pageContext.setAttribute("afAcceptLang", locale, PageContext.REQUEST_SCOPE);
%>
<%-- The attribute sling.max.calls is set to temporarily fix the "Too May calls" Exception.
     Refer to CQ-51621 for more info.--%>
<%
    GuideContainer guideContainer = (GuideContainer)pageContext.getAttribute("guideContainer", PageContext.REQUEST_SCOPE);
    guideContainer.setMaxCallCounter(slingRequest);
%>

<% String previousGuideContainerPath = GuideContainerThreadLocal.getGuideContainerPath();
    GuideContainerThreadLocal.setGuideContainerPath(resource.getPath());
%>
<c:if test="${isEditMode}">
    <c:if test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
        <script>
            (function () {
                //guidelib is not defined
                window.guidelib = window.guidelib || {};
                var bootstrapPlugins = ["alert", "button", "modal", "popover", "tooltip"],
                    backupPlugins = bootstrapPlugins;
                if (typeof _customPlugins_ !== "undefined" && _customPlugins_ instanceof Array) {
                    bootstrapPlugins.concat(_customPlugins_);
                }
                guidelib._oldPlugins_ = {};
                backupPlugins.forEach(function (pluginName) {
                    if (typeof $.fn[pluginName] !== "undefined") {
                        guidelib._oldPlugins_[pluginName] = $.fn[pluginName];
                    }
                });
            }());
        </script>
        <div id="af-expression-editor" class="coral--light">
            <sling:include path="" resourceType="fd/expeditor/renderers/fulleditor" />
        </div>
        <script>
            (function () {
                _.each(guidelib._oldPlugins_, function(plugin, pluginName) {
                    $.fn[pluginName] = plugin;
                });
                guidelib._oldPlugins_ = undefined;
                // it will be defined again in Namespace.js (included by the i18n clientlib)
                guidelib = undefined;
            }());
        </script>
    </c:if>
</c:if>
<%--- Note: Any modification in runtime clientlib should also reflect in GuideModelTransformerImpl.java  --%>
<c:if test="${!isEditMode && !targetMode}">
    <ui:includeClientLib categories="guides.I18N.${guide:getLocale(slingRequest,resource)}"/>
</c:if>
<c:choose>
    <c:when test="${isEditMode}">
      <c:choose>
         <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
             <ui:includeClientLib categories="guides.3rdparty.guidesAuthoring,guides.common"/>
             <ui:includeClientLib categories="guideAuthoring"/>
         </c:when>
         <c:otherwise>
             <%-- We should be loading jquery and underscore used in runtime as the runtime code is loaded here --%>
             <ui:includeClientLib
                     categories="xfaforms.authoring3rdparty,guides.3rdparty.guidesAuthoring,guides.common,
                     xfaforms.xfalibwidgets.author"/>
             <ui:includeClientLib categories="af.customwidgets"/>
             <%-- CSS libraries are loaded in child window --%>
             <ui:includeClientLib css="guides.touchAuthoring"/>
         </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
        <%--- Including the js present in the client library mentioned in the guide container dialog  --%>
        <%--- Please Note: Only the js is included, we dont include the css present in the client library  --%>
        <%--- Do not load the JS again as only form tag is being replaced for AJAX call (target mode) --%>
        <c:if test="${!targetMode}">
            <c:if test="${not empty guideClientLibRef}">
                <ui:includeClientLib js="${guideClientLibRef}"/>
            </c:if>
            <c:if test="${hasXDP}">
                <ui:includeClientLib categories="guideRuntimeWithXFA"/>
            </c:if>
            <c:if test="${not hasXDP}">
                <ui:includeClientLib categories="guideRuntime"/>
            </c:if>
            <ui:includeClientLib categories="af.customwidgets"/>
        </c:if>
            <%
                try {
            %>
            <c:set var="guideAutoSaveStrategyFilePath" value="${guideContainer.autoSaveStrategyFilePath}" />
            <c:if test="${not empty guideAutoSaveStrategyFilePath}">
                <sling:include path="${guideContainer.path}" resourceType="${guideAutoSaveStrategyFilePath}" replaceSelectors="<%=GuideConstants.INIT_JSP_NODENAME%>"/>
            </c:if>
            <%
                } catch (Exception e) {
                    log.error("File not present at path.", e);
                }
            %>
    </c:otherwise>
</c:choose>
<ui:includeClientLib categories="form.noConflict"/>
<ui:includeClientLib css="aemfd.ccm.channel.contentpage"/>
<c:if test="${isEditMode}">
    <ui:includeClientLib categories="aemfd.ccm.channel.documentfragment"/>
<%
AdaptiveFormConfigurationService configurationService = sling.getService(AdaptiveFormConfigurationService.class);
String defaultMode = configurationService.getRuleEditorDefaultMode();
ResourceResolver rr = slingRequest.getResourceResolver();
UserManager um = rr.adaptTo(UserManager.class);
boolean allowScriptAuthoring = GuideUtils.isScriptAuthoringAllowed(slingRequest.getUserPrincipal(),um);
boolean showRuleEditor = GuideUtils.showRuleEditor(slingRequest.getUserPrincipal(),um,configurationService.getCustomRuleEditorGroups());
%>
    <c:choose>
        <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
            <script>
                 guidelib.author.ExpressionEditorUtil.setRuleEditorDefaultMode(<%=defaultMode%>);
                 guidelib.author.ExpressionEditorUtil.allowScriptAuthoring(<%=allowScriptAuthoring %>);
                 guidelib.author.AuthorUtils.showRuleEditor(<%=showRuleEditor %>);
            </script>
        </c:when>
        <c:otherwise>
            <script>
                // todo: have to change this later ?
                if(window.parent.guidelib && window.parent.guidelib.author.ExpressionEditorUtil){
                    // Initialize the exp editor content in parent window in touch
                    window.parent.guidelib.author.ExpressionEditorUtil.setRuleEditorDefaultMode(<%=defaultMode%>);
                    window.parent.guidelib.author.ExpressionEditorUtil.allowScriptAuthoring(<%=allowScriptAuthoring %>);
                    window.parent.guidelib.author.AuthorUtils.showRuleEditor(<%=showRuleEditor %>);
                } else {
                    /**
                     * Listener on parent frame to initialize the expression editor default mode
                     */
                    window.parent.jQuery(document).on('cq-editor-loaded', function (event) {
                        // Initialize the exp editor content in parent window in touch
                        window.parent.guidelib.author.ExpressionEditorUtil.setRuleEditorDefaultMode(<%=defaultMode%>);
                        window.parent.guidelib.author.ExpressionEditorUtil.allowScriptAuthoring(<%=allowScriptAuthoring %>);
                        window.parent.guidelib.author.AuthorUtils.showRuleEditor(<%=showRuleEditor %>);
                    });
                }
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
<form id="guideContainerForm" autocomplete = "off" data-replaceable-tag="guideContainerForm" data-iframe-height>
    <%
        // get json for all non on demand childern only
        guideContainer.setRenderCall(true);
        AdaptiveFormConfigurationService configurationService = sling.getService(AdaptiveFormConfigurationService.class);
        boolean clientSideMerge = configurationService.isClientSideMergeSupported();
        String afInitializationState = guideContainer.getGuideInitializationState(clientSideMerge);
        String xdpRenderError = "";
        String metaTemplateExistsError = "";
        boolean addGuideSyncMessage = guideContainer.isGuideSyncRequired();
        boolean hasXDP = guideContainer.getXdpRef().length() > 0;
        boolean validXDP = hasXDP && guideContainer.isXDPValid();
        String metaTemplateRef = guideContainer.getMetaTemplateRef();
        boolean hasMetaTemplate = metaTemplateRef.length() > 0;
        boolean validMetaTemplate = hasMetaTemplate && guideContainer.isMetaTemplateValid();
        boolean isMetaTemplateUpdated = guideContainer.isMetaTemplateUpdated();
        if(validXDP) {
            try {
                guideContainer.getXfaJson();
                guideContainer.getXfaRenderContext();
            } catch (Exception e) {
                I18n localI18n = new I18n(slingRequest);
                xdpRenderError = localI18n.getVar("Unable to generate JSON from Template provided in Adaptive Form. Please see the server logs for more Information");
            }
        } else if(hasXDP) {
            I18n localI18n = new I18n(slingRequest);
            xdpRenderError = localI18n.getVar("Template provided in the Adaptive Form doesn't exists [")  +
                            guideContainer.getXDPName() + localI18n.getVar("]");
            addGuideSyncMessage = false;
        }

        if(validMetaTemplate) {
            if (isMetaTemplateUpdated) {
                addGuideSyncMessage = true;
            }
        } else if(hasMetaTemplate) {
            I18n localI18n = new I18n(slingRequest);
            metaTemplateExistsError = localI18n.getVar("Document of Record Template provided at") + "<br />" +
                    "<b>" + metaTemplateRef + "</b>" +
                    localI18n.getVar(" in the Adaptive Form does not exist.") + "<br /><br />" + "<i>" +
                    localI18n.getVar("Either upload the template or click below to unlink the template from Adaptive Form.") + "</i>";
            addGuideSyncMessage = true;
        }

        String updatedAsset = addGuideSyncMessage ? (isMetaTemplateUpdated ?
                GuideConstants.GUIDE_ASSETS.META_TEMPLATE.getAsset() : GuideConstants.GUIDE_ASSETS.XDP_TEMPLATE.getAsset()) : "";
        String errorMessage = isMetaTemplateUpdated ? metaTemplateExistsError : xdpRenderError;

    %>
<%--- Including the action field section to a seperate JSP included below  --%>
    <cq:include script="guideIntegration.jsp"/>

    <div class="guideContainerWrapperNode ${guideContainer.nodeClass} container"
         role="main"
         data-path="${guideContainer.path}"
         data-guide-test-data="<%= (slingRequest.getParameter("addTestData")!= null) ? GuideUtils.escapeXml(afInitializationState) : null %>"
         data-tmproot="<%= UUID.randomUUID().toString()%>"
         <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guideContainer.authoringConfigJSON,xssAPI)}' </c:if>
          >
        <div class="${guideContainer.nodeClass}">
          <%--Include the layout script via this tag
            This tag would execute the script or fetch the HTML of the layout  of the
            guideContainer at runtime . At authoring there is no caching--%>
            <guide:guideContainerLayoutHTML/>
        </div>
    </div>
    <c:if test="${isEditMode && guideContainer.showAuthoringWarnings}">
        <c:choose>
            <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
                <div id="guide_statusbar">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">${guideContainer.statusBarTitle}</h3>
                            <span class="badge counter"></span>
                            <span class="glyphicon glyphicon-open pull-right"></span>
                            <button type="button" class="close" aria-hidden="true">&times;</button>
                        </div>
                        <div class="panel-body">
                            <ul></ul>
                        </div>
                    </div>
                </div>
                <script>
                    if(window.guidelib.author.statusBar){
                        window.guidelib.author.statusBar.init("#guide_statusbar", <%=addGuideSyncMessage%>, "<%=updatedAsset%>");
                        window.guidelib.author.statusBar.addMessage("<%=errorMessage%>");
                    }
                </script>
            </c:when>
            <c:otherwise>
                <script>
                    // Set the add guide sync message and xdp render error message

                    if(window.parent.guidelib && window.parent.guidelib.touchlib
                       && window.parent.guidelib.touchlib.initializers.initializeErrorManager) {
                        window.parent.guidelib.touchlib.initializers.initializeErrorManager._setAddGuideSyncMessage(<%=addGuideSyncMessage%>);
                        window.parent.guidelib.touchlib.initializers.initializeErrorManager._setUpdatedAsset("<%=updatedAsset%>");
                        window.parent.guidelib.touchlib.initializers.initializeErrorManager._setErrorMessage("<%=errorMessage%>");
                        <%
                            I18n localI18n = new I18n(slingRequest);
                            List<GuideUtils.AuthoringError> errorList = GuideUtils.validateFormAuthoredState(guideContainer, afInitializationState, localI18n);
                            for (GuideUtils.AuthoringError error: errorList) {
                        %>
                        window.parent.guidelib.touchlib.initializers.initializeErrorManager._addErrorMessage("<%=error.getErrorMessage()%>", "<%=error.getErrorCode()%>", "<%=error.getErrorType()%>");
                        <%
                            }
                        %>
                    }
                </script>
            </c:otherwise>
        </c:choose>
        <script>
            if(window.guidelib.author.GuideExtJSDialogUtils) {
                window.guidelib.author.GuideExtJSDialogUtils.bindRefField.setBindRefFlag(${hasXDP || hasXSD});
            }
        </script>
    </c:if>
    <c:if test="${!isEditMode}">
	    <%-- populating the customContextPropJson object with the map obtained from request attribute --%>
        <%
        JSONObject customContextPropJson = guideContainer.getCustomContextPropJson(request);
        %>
        <script>
        <%-- If loading through default and targeting is enabled, load the container delayed to
            provide scope to get the updated container (B scenario in AB Test)
        --%>
        <c:set var="alternateGuideContainerPath" value="<%=GuideUtils.getAlternateContainerPathFromCurrentContainer(slingRequest.getRequestPathInfo())%>" />
			window.guidelib.__runtime__.target = window.guidelib.__runtime__.target || {};
            window.guidelib.__runtime__.target.loadExperience = function(force) {
                if(!force && window.guidelib.guideReplaced == true) {
                         return;
                }
                window.guidelib.guideReplaced = true;
                window.guideBridge.registerConfig("contextPath", "${slingRequest.contextPath}");
                window.guideBridge.customContextProperty(<%= customContextPropJson %>); //registering the customContextPropJson in the guideContext
                window.guidelib.model.fireOnContainerDomElementReady(<%=afInitializationState%>, <%=clientSideMerge%>, null, <%= customContextPropJson %>);
                window.guideBridge._readRuntimeLocale("<%= GuideUtils.getGuideRuntimeLocale(slingRequest, resource)%>");
                <c:if test="<%= request.getAttribute(GuideConstants.GUIDE_ERROR) != null%>">
                    <c:set var="guideError" value="<%=(JSONObject) request.getAttribute(GuideConstants.GUIDE_ERROR)%>" />
                        var errorJsonObject = ${guideError};
                        window.guideBridge._handleServerValidationError(errorJsonObject);
                </c:if>
            };
        <c:choose>
            <c:when test="${!targetMode && targetEnabled}">
            setTimeout(window.guidelib.__runtime__.target.loadExperience, 3000);
            </c:when>
            <c:when test="${targetMode && targetEnabled}">
            window.guidelib.__runtime__.target.loadExperience(true);
            </c:when>
            <c:otherwise>
            window.guidelib.__runtime__.target.loadExperience();
            </c:otherwise>
            </c:choose>
            <c:choose>
            <c:when test="${targetEnabled}">
            <%--Flag protect the fetching code block - This is needed to optimize size of
                HTML payload inserting complete JSON again increses the size --%>
            window.guidelib.__runtime__.target.fetchAlternateExperience = function(){
                var data = guidelib.util.GuideUtil.fetchDataXml(${guideInitializationState});
                var alternateGuidePath = guidelib.util.GuideUtil.detectContextPath() + "${alternateGuideContainerPath}";
                window.guidelib.util.GuideUtil.updateContainer(alternateGuidePath, data);
            };
            </c:when>
            </c:choose>
        </script>
    </c:if>
    <%-- added a hidden input button for submitting the guideContainerForm, submission is dummy and will be stopped so that
    browser can remember autocomplete values --%>
    <input type="submit" class="guideContainerFormSubmitButton" style = "display : none;" />
</form>
<c:if test="${targetEnabled}">
    <c:if test="${!isEditMode && !targetMode}" >
        <div id="guideTargetReplaceId" data-target-tag="guideTargetReplaceTag"></div>
    </c:if>
</c:if>
<div id="guideContainerTheme">
    <cq:include script="includeTheme.jsp"/>
    <c:set var="guideCssFileRef" value="${guideContainer.cssFileRef}" />
    <c:if test="${not empty guideCssFileRef}">
        <link href="${guideCssFileRef}" rel="stylesheet" type="text/css"/>
    </c:if>
    <c:if test="${not empty guideClientLibRef}">
        <ui:includeClientLib css="${guideClientLibRef}"/>
    </c:if>
    <%
        PageStyleService pageStyleService = sling.getService(PageStyleService.class);
        ResourceResolver rr = slingRequest.getResourceResolver();
        String cssStyle = pageStyleService.getCSSStyle(rr, guideContainer.getPagePath(), slingRequest.getContextPath());
        pageContext.setAttribute("cssStyle", cssStyle);
    %>
    <c:if test="${not empty cssStyle}">
        <link href="${request.contextPath}${guideContainer.pagePath}.inline.css" rel="stylesheet" type="text/css"/>
    </c:if>
</div>
<c:if test="${!isEditMode && !targetMode && !isTouchAuthoring}">
    <script>
        $("#loadingPage").removeClass("guideLoading");
    </script>
</c:if>
<% GuideContainerThreadLocal.setGuideContainerPath(previousGuideContainerPath); %>
<c:if test="${isEditMode}">
    <%
        String requestPath = request.getPathInfo();
        //check if template structure is being rendered, if so then add guideContainer placeholder
        if (requestPath != null && requestPath.startsWith("/conf/") && requestPath.endsWith("/structure.html")) {
    %>
    <%-- Placeholder div for Adaptive form container in structure layer --%>
    <div class="cq-placeholder" data-emptytext="<%= (new I18n(slingRequest)).getVar("Adaptive Form Container") %>"></div>
    <%
        }
    %>
</c:if>
<%
    // end of AB Testing specific logic
    }
%>
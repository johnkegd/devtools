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
  Guide Panel Component
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.taglibs.GuideELUtils" %>
<%@ page import="com.adobe.aemds.guide.utils.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils,
                 org.apache.sling.api.resource.ValueMap,
                 com.adobe.aemds.guide.service.AdaptiveFormConfigurationService,
                 com.day.cq.wcm.api.AuthoringUIMode" %>
<%
    AdaptiveFormConfigurationService adaptiveFormConfigurationService = sling.getService(AdaptiveFormConfigurationService.class);
    I18n i18n = null;
%>
<c:if test="${isEditMode}">
    <%
        i18n = new I18n(slingRequest.getResourceBundle(slingRequest.getLocale()));
    %>
</c:if>
<c:set var="showFragmentPlaceholder" value="<%= adaptiveFormConfigurationService.getShowPlaceholder()%>"/>

<guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuidePanel" restoreOnExit="true">
    <%-- Wrapper Div --%>
    <div class="<%=GuideConstants.GUIDE_PANEL%>Node ${guide:encodeForHtmlAttr(guidePanel.name,xssAPI)} ${guide:encodeForHtmlAttr(guidePanel.afFragmentMarker,xssAPI)} ${guide:encodeForHtmlAttr(guidePanel.cssClassName,xssAPI)}"
         id="${guidePanel.id}" data-path="${guidePanel.path}"
         style="${guide:encodeForHtmlAttr(guidePanel.styles,xssAPI)};${guide:encodeForHtmlAttr(guidePanel.panelInlineStyles,xssAPI)}"
         data-guide-view-bind="${guidePanel.id}"
            <c:if test="${isEditMode}"> data-guide-authoringconfigjson='${guide:encodeForHtmlAttr(guidePanel.authoringConfigJSON,xssAPI)}' </c:if>
            <c:if test="${not empty guidePanel.optimizeRenderPerformance}"> data-guide-asset-ref=${guidePanel.id} </c:if>>
        <guide:lazyLoadPanel>
            <c:choose>
                <%-- Written for backward compatibility of layouts --%>
                <c:when test="${not empty guidePanelResourceType}">
                    <%-- Here resource type is always path of jsp, hence not adding selector string --%>
                    <cq:include path="${guidePanel.path}" resourceType="${guide:consumeContextProperty('guidePanelResourceType', slingRequest)}"/>
                </c:when>
                <c:when test="${isEditMode && not empty guidePanel.fragRefPropertyFromResource && !guidePanel.fragmentAvailable}">
                    <div class="authoring-errormsg">
                        <%= i18n.get("The fragment at this path is not available: ") %> ${guide:encodeForHtml(guidePanel.fragRefPropertyFromResource,xssAPI)}
                    </div>
                </c:when>
                <c:when test="${((isEditMode && !( not empty guidePanel.fragRef  && showFragmentPlaceholder) ) || (!isEditMode ) )&& not empty guidePanelLayout}">
                    <sling:include path="${guidePanel.path}" resourceType="${guide:consumeContextProperty('guidePanelLayout', slingRequest)}" replaceSelectors="${guide:consumeContextProperty('guidePanelLayoutContainerSelector', slingRequest)}"/>
                </c:when>
                <c:otherwise>
                    <%-- Include all the child items here   --%>
                    <%-- Please Note: Request may have selector string in it, reset if not required during sling include using replaceSelectors attribute   --%>
                    <c:choose>
                        <%--I am a fragment reference panel, include items from fragments and disable their editable--%>
                        <c:when test="${not empty guidePanel.fragRef}">
                            <c:choose>
                                <c:when test="${isEditMode && showFragmentPlaceholder}">
                                    <div class="fragmentPlaceholderContainer">
                                        <div class="fragmentTitle">
                                            ${guide:encodeForHtmlAttr(guidePanel.fragmentDetails.title,xssAPI)}
                                        </div>
                                        <hr class="fragmentSeparator"/>
                                            ${guidePanel.fragmentDetails.fieldDetails}
                                    </div>
                                </c:when>
                                <c:otherwise>

                                    <%
                                        String fragRefPreviousPrefixID = null,
                                                prevContainerPath = null,
                                                fragRefPrefix = null;
                                        Resource fragRefContainer = null;
                                        I18n i18nFragment = null,
                                                i18nPrevious = null;
                                        try {
                                            // This change is for generating correct ID for the fragment's child,
                                            // This will ensure that you add a prefix hierarchy of the AF where
                                            // this fragment was included
                                            GuideFragmentHolder guideFragmentHolder = GuideContainerThreadLocal.getGuideFragmentHolder();
                                            prevContainerPath = GuideContainerThreadLocal.getGuideContainerPath();
                                            if (guideFragmentHolder != null) {
                                                fragRefPreviousPrefixID = guideFragmentHolder.getFragPrefixID();
                                                i18nPrevious = guideFragmentHolder.getI18n();
                                                GuidePanel guidePanel = (GuidePanel) pageContext.getAttribute("guidePanel", PageContext.REQUEST_SCOPE);
                                                String fragRef = guidePanel.getFragRef();
                                                Resource fragRefRootPanel = resourceResolver.getResource(fragRef);
                                                fragRefContainer = fragRefRootPanel.getParent();
                                                ValueMap containerValueMap = fragRefContainer.adaptTo(ValueMap.class);
                                                if (containerValueMap != null) {
                                                    String clientLibRef = (String) containerValueMap.get(GuideConstants.CLIENT_LIB_REF);
                                                    if (clientLibRef != null && clientLibRef.length() > 0) {
                                                        guidePanel.setClientLibRef(clientLibRef);
                                                    }
                                                }
                                                i18nFragment = GuideELUtils.getI18n(slingRequest, fragRefContainer);
                                            }
                                            //first get the fragment prefix and then set the container path to thread local as
                                            //getting fragment prefix gets parent container path from thread local
                                            fragRefPrefix = NodeStructureUtils.getFragPrefixString(resource, fragRefPreviousPrefixID);
                                            GuideContainerThreadLocal.setGuideFragmentHolder(fragRefPrefix, null, null, i18nFragment);
                                            if (fragRefContainer != null) {
                                                GuideContainerThreadLocal.setGuideContainerPath(fragRefContainer.getPath());
                                            }
                                            // We do not want editables in authoring mode for fragments so
                                            // better set mode to disabled for children of the same
                                            // and restore it after fragment
                                            WCMMode modePrevious = WCMMode.fromRequest(request);
                                            WCMMode.DISABLED.toRequest(request);
                                    %>
                                    <%--clientLibRef is kept of guideContainer and included in guideContainer.jsp but for fragments
                                    we get the children of root panel so including clientLibRef here--%>
                                    <c:if test="${not empty guidePanel.clientLibRef}">
                                        <ui:includeClientLib categories="${guidePanel.clientLibRef}"/>
                                    </c:if>
                                    <sling:include path="${guidePanel.fragRef}/items" resourceType="${guidePanel.layoutPath}" replaceSelectors=""/>
                                    <%
                                            modePrevious.toRequest(request);
                                        } catch (Exception e) {
                                            log.error("Error while restoring previous fragRef", e);
                                        } finally {
                                            // Restore the previous fragment prefix
                                            // This is needed for nested fragments to work
                                            // For items not in fragment hierarchy the suffix would be null
                                            // As a convention (inline with setting), while restoring first restore
                                            // guide container path and then the fragment holder
                                            GuideContainerThreadLocal.setGuideContainerPath(prevContainerPath);
                                            GuideContainerThreadLocal.setGuideFragmentHolder(fragRefPreviousPrefixID, null, null, i18nPrevious);
                                        }
                                    %>
                                </c:otherwise>
                            </c:choose>

                        </c:when>
                        <c:otherwise>
                            <sling:include path="items" resourceType="${guidePanel.layoutPath}" replaceSelectors=""/>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </guide:lazyLoadPanel>
            <%-- End of Wrapper Div --%>
    </div>
    <c:if test="${isEditMode}">
        <% //Putting name on panel toolbar
            GuideELUtils.setToolbarLabel(properties.get("name", ""), i18n.get("Panel: "), editContext, slingRequest);
            String fragRef = properties.get(GuideConstants.FRAG_REF, "");
            String bindRef = properties.get(GuideConstants.BIND_REF, "");
            // fragRef would be /content/dam/formsanddocuments/fragAfName
            String nameOfFragmentAF = StringUtils.substringAfterLast(fragRef, "/");
            String panelPath = resource.getPath().toString();
            if ( fragRef.length() > 0) {
                fragRef = GuideUtils.convertFMAssetPathToContainerPath(fragRef);
                // TODO: leaving this rootPanel hardcoded for now
                fragRef = fragRef + "/" + GuideConstants.ROOTPANEL_NODENAME;
                //NOCHECKMARX - All parameters are coming from property preventing Reflective XSS All Clients.
                GuideUtils.setEmbedFragButton("Embed Fragment", editContext, slingRequest, fragRef, resource.getPath(), bindRef);
            } else {
                if (!GuideUtils.isWebChannel(resource)) {
                    GuideUtils.setButtonForPanel("Save as Fragment", editContext, slingRequest, resource.getPath(), bindRef,
                    "function(){guidelib.author.editConfigListeners.getFragmentCreationDialog( \""+ panelPath + "\");}");
                }
                GuideUtils.setButtonForPanel("Add Child Panel", editContext, slingRequest, resource.getPath(), bindRef,
                        "function(){guidelib.author.editConfigListeners.addChildPanel(\""+ panelPath + "\");}");
                GuideUtils.setButtonForPanel("Add Panel Toolbar", editContext, slingRequest, resource.getPath(), bindRef,
                        "function(){guidelib.author.editConfigListeners.toolbar.addPanelToolbar(\""+ panelPath + "\");}");
            }
        %>
        <c:set var="bindReference" value="data-xdp-som='${guide:encodeForHtmlAttr(guidePanel.bindRef,xssAPI)}'" />
        <div class="alert_indicator ${guidePanel.valid ? "guidevalid_indicator" : "guideinvalid_indicator"}"
            ${not empty guidePanel.bindRef ? bindReference : ""}
             fragmentRef="<%=fragRef%>"
             data-guide-name="${guide:encodeForHtmlAttr(guidePanel.name,xssAPI)}"
             data-guide-error="${guide:encodeForHtmlAttr(guidePanel.error,xssAPI)}"
             data-guide-path="${guidePanel.path}"
             data-guide-id="${guidePanel.id}">
        </div>
    </c:if>
</guide:initializeBean>
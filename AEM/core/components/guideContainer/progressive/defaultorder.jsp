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
<%@ page import="com.adobe.aemds.guide.utils.DefaultProgressiveOrderingGenerator ,
                 com.adobe.aemds.guide.service.GuideModelTransformer,
                 com.adobe.aemds.guide.utils.DefaultProgressiveOrderingGenerator,
                 com.adobe.aemds.guide.utils.JSONCreationOptions,
                 com.adobe.aemds.guide.utils.JSONCreationOptions,
                 org.apache.sling.commons.json.JSONObject,
                 com.adobe.aemds.guide.utils.GuideUtils,
                 com.adobe.aemds.guide.utils.*,
                 org.apache.sling.api.resource.ResourceResolver" %>
<%
    I18n i18n = GuideELUtils.getI18n(slingRequest, resource);
    GuideModelTransformer guideModelTransformer = sling.getService(GuideModelTransformer.class);
    JSONCreationOptions jsonCreationOptions = new JSONCreationOptions(i18n, true, true,new Locale(GuideUtils.getAcceptLang(slingRequest)), (Resource)resource);
    JSONObject guideJson = guideModelTransformer.exportGuideJsonObject((Resource)resource, jsonCreationOptions);
    DefaultProgressiveOrderingGenerator defaultProgressiveOrderingGenerator = new DefaultProgressiveOrderingGenerator(resourceResolver);
    String pdcOrder = defaultProgressiveOrderingGenerator.generateProgressiveOrdering(guideJson);
    response.setContentType("application/json; charset=UTF-8");
    out.println(pdcOrder);
%>

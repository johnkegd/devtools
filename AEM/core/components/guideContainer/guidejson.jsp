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
<%@ page import="com.adobe.aemds.guide.service.GuideModelTransformer" %>
<%@ page import="com.adobe.aemds.guide.utils.JSONCreationOptions" %>
<%
    I18n i18n = GuideELUtils.getI18n(slingRequest, resource);
    GuideModelTransformer guideModelTransformer = sling.getService(GuideModelTransformer.class);
    response.setContentType("application/json; charset=UTF-8");
    String dataRef = (String) slingRequest.getAttribute("dataRef");
    if (dataRef == null || dataRef.isEmpty()) {
        dataRef = slingRequest.getParameter("dataRef");
    }
    String formContainerPath = (String) slingRequest.getAttribute("formContainerPath");
    if (formContainerPath == null) {
        formContainerPath = slingRequest.getParameter("formContainerPath");
    }
    String guideStatePathRef = (String) slingRequest.getAttribute("guideStatePathRef");
    if (guideStatePathRef == null || guideStatePathRef.isEmpty()) {
        guideStatePathRef = slingRequest.getParameter("guideStatePathRef");
    }
    Map prefillServiceParamMap = (Map) slingRequest.getAttribute(GuideConstants.GUIDE_PREFILL_SERVICE_PARAMS);
    JSONCreationOptions options = new JSONCreationOptions();
    options.setI18n(i18n).setFormContainerPath(formContainerPath).setDataRef(dataRef);
    if(prefillServiceParamMap != null){
        options.setPrefillServiceParams(prefillServiceParamMap);
    }
    if ((dataRef != null && !dataRef.isEmpty())) {
        out.println(guideModelTransformer.getDataJson(resource, options));
    } else if ((guideStatePathRef != null && !guideStatePathRef.isEmpty())) {
        //NOCHECKMARX - exportGuideStateFromStore doesn't has user input directly preventing Reflected XSS All Clients.
        out.println(guideModelTransformer.exportGuideStateFromStore(guideStatePathRef));
    } else {
        out.println(guideModelTransformer.exportGuideJson(resource, i18n));
    }
%>

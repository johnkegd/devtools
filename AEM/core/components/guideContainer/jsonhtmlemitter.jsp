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
<%@ page import="com.adobe.aemds.guide.service.GuideModelImporter" %>
<%@ page import="com.adobe.aemds.guide.utils.*" %>
<%
    String guidePath = resource.getPath();
    GuideModelImporter guideModelImporter = sling.getService(GuideModelImporter.class);
    String templateId = slingRequest.getParameter("templateId");
    LazyLoadingOptions lazyLoadingOptions = new LazyLoadingOptions();

    String json = null, html= null, multipleJson = null;
    String fetchJSON = slingRequest.getParameter("fetchJSON");
    String fetchHTML = slingRequest.getParameter("fetchHTML");
    String fetchMultipleJson = slingRequest.getParameter("fetchMultipleJson");

    if (fetchJSON != null && "true".equals(fetchJSON)) {
        lazyLoadingOptions.setOptionsForChildPanelJSON(GuideJsonHtmlEmitterFlag.GET_CHILD_PANEL_JSON,
                null, slingRequest, guidePath);
        lazyLoadingOptions.setTemplateId(templateId);
        // will be getting a json object containing only JSON served to client
        json = guideModelImporter.getJSONHTMLFragmentOrForm(lazyLoadingOptions);
    }
    if(fetchHTML != null && "true".equals(fetchHTML)) {
        lazyLoadingOptions = new LazyLoadingOptions();
        lazyLoadingOptions.setOptionsForChildPanelHTML(GuideJsonHtmlEmitterFlag.GET_CHILD_PANEL_HTML, null,
                slingRequest, guidePath, slingResponse);
        lazyLoadingOptions.setTemplateId(templateId);
        html = guideModelImporter.getJSONHTMLFragmentOrForm(lazyLoadingOptions);
    }
    if(fetchMultipleJson != null && "true".equals(fetchMultipleJson)){
        lazyLoadingOptions.setOptionsForPiggyBankJSON(GuideJsonHtmlEmitterFlag.GET_PIGGY_BANKED_JSON,
                slingRequest.getParameter("listOfTemplateIds"),
                slingRequest, guidePath);
        multipleJson = guideModelImporter.getJSONHTMLFragmentOrForm(lazyLoadingOptions);
    }
    // Response need to be set here only because dispacher in case when
    //  HTML is not present in cache , it would have set contentType to text/html
    response.setContentType("application/json; charset=UTF-8");
    out.print(GuideUtils.formJsonHtmlString(json, html, multipleJson));

%>

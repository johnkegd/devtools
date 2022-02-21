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
<%@page import="com.adobe.aemds.guide.model.FormSubmitInfo,
                com.adobe.aemds.guide.service.FormSubmitActionManagerService,
                com.adobe.aemds.guide.servlet.GuideSubmitServlet" %>

<%@ page import="com.adobe.aemds.guide.utils.GuideSubmitUtils" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideUtils" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants" %>
<%@ page import="com.adobe.forms.common.submitutils.CustomResponse" %>
<%@ page import="com.adobe.aemds.guide.common.GuideValidationResult" %>

<%@ page import="org.apache.http.Header" %>
<%@ page import="org.apache.http.HttpEntity" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.HttpStatus" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.utils.URLEncodedUtils" %>
<%@ page import="org.apache.http.entity.ContentType" %>
<%@ page import="org.apache.http.entity.mime.MultipartEntity" %>
<%@ page import="org.apache.http.entity.mime.MultipartEntityBuilder" %>
<%@ page import="org.apache.http.entity.mime.content.InputStreamBody" %>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.apache.sling.api.SlingHttpServletResponse" %>
<%@ page import="org.slf4j.Logger" %>

<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>

<%!

    private final Logger log = LoggerFactory.getLogger(getClass());

%>


<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%>
<%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<sling:defineObjects/>
<%
    Map<String,String> redirectParameters;
    redirectParameters = GuideSubmitUtils.getRedirectParameters(slingRequest);
    if(redirectParameters==null) {
        redirectParameters = new HashMap<String, String>();
    }

    FormSubmitActionManagerService submitActionServiceManager = sling.getService(FormSubmitActionManagerService.class);
    FormSubmitInfo submitInfo = (FormSubmitInfo) request.getAttribute(GuideConstants.FORM_SUBMIT_INFO);
    Map<String, Object> resultMap = submitActionServiceManager.submit(submitInfo, Boolean.FALSE);
    if (resultMap == null) {
        resultMap = new HashMap<String, Object>();
    }
    for (Map.Entry<String, Object> stringObjectEntry : resultMap.entrySet()) {
        if (!GuideConstants.FORM_SUBMISSION_COMPLETE.equals(stringObjectEntry.getKey())) {
            if(stringObjectEntry.getValue() != null) {
                redirectParameters.put(stringObjectEntry.getKey(), stringObjectEntry.getValue().toString());
            }
        }
    }

    Object isSubmissionComplete = resultMap.get(GuideConstants.FORM_SUBMISSION_COMPLETE);
    log.debug("resultMap.containsKey(GuideConstants.FORM_SUBMISSION_ERROR) " + resultMap.containsKey(GuideConstants.FORM_SUBMISSION_ERROR));

    //Check If post submission is enabled
    if (!resultMap.containsKey(GuideConstants.FORM_SUBMISSION_ERROR)
    && (isSubmissionComplete == null || !(Boolean)isSubmissionComplete)
    && properties.get("enableRestEndpointPost", (String) null) != null
    && properties.get("restEndpointPostUrl", (String) null) != null) {
        String postUrl = properties.get("restEndpointPostUrl", (String) null);
        // Check if this is a resource then proceed with a pseudo request forward
        // and get the response
        GuideValidationResult guideValidationResult = null;

        if (resourceResolver.getResource(postUrl) != null) {
            SlingHttpServletResponse wrappedResponse = GuideUtils.processInternalPostOnRestEndPoint(slingRequest, slingResponse, postUrl);
            if (wrappedResponse.getStatus() != response.SC_OK) {
                guideValidationResult = GuideSubmitUtils.getGuideValidationResultFromString("Couldn't post data to " + postUrl, Integer.toString(wrappedResponse.getStatus()));
                resultMap.put(GuideConstants.FORM_SUBMISSION_ERROR, guideValidationResult);
                log.error("Couldn't post data to " + postUrl);
                response.setStatus(500);  //set response code as error.
            } else if (wrappedResponse.getContentType() != null &&
                    wrappedResponse.getContentType().contains(URLEncodedUtils.CONTENT_TYPE)) {
                String responseString = new String(((CustomResponse) wrappedResponse).getCopy());
                GuideUtils.putQueryParamsToRedirectRequest(responseString, redirectParameters);
                resultMap.put(GuideConstants.FORM_SUBMISSION_COMPLETE, Boolean.TRUE);
                response.setStatus(200);
            } else {
                // This redundant else
                //is needed for fixing some compile time bug
                // Some java compiler is requiring this redundant else
            }
        } else {
            isSubmissionComplete = resultMap.get(GuideConstants.FORM_SUBMISSION_COMPLETE);
            if (isSubmissionComplete == null || !(Boolean)isSubmissionComplete) {
                guideValidationResult = GuideSubmitUtils.getGuideValidationResultFromString("Couldn't resolve post URL:  " + postUrl, "500");
                resultMap.put(GuideConstants.FORM_SUBMISSION_ERROR, guideValidationResult);
                log.error("Couldn't resolve post URL:  " + postUrl);
                response.setStatus(500); //set response code as error.
            }
        }
    }

    GuideSubmitUtils.handleValidationError(request, response, resultMap);
    GuideSubmitUtils.setRedirectParameters(slingRequest,redirectParameters);
%>
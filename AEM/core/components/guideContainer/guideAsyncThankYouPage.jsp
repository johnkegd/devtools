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
<%@ page import="java.util.Map,
                 org.apache.sling.api.resource.ValueMap,
                 org.apache.sling.commons.json.JSONObject,
                 com.adobe.aemds.guide.utils.GuideConstants,
                 com.adobe.aemds.guide.utils.GuideSubmitUtils" %>
<%@ page contentType="application/json;charset=UTF-8" %>
<% Map<String, String[]> parameters = request.getParameterMap();
    JSONObject jsonObject = new JSONObject();
    for (Map.Entry<String, String[]> param : parameters.entrySet()) {
        String key = param.getKey();
        String value = param.getValue()[0];
        //NOCHECKMARX - contentType json prevents XSS attack
        jsonObject.put(key, value);
    }

    if (jsonObject.has(GuideConstants.PROP_KEY_AF_SUCCESS_PAYLOAD)) {
       Resource formResource = slingRequest.getResource();
       String afSuccessPayloadString = jsonObject.getString(GuideConstants.PROP_KEY_AF_SUCCESS_PAYLOAD);
       JSONObject afSuccessPayload = new JSONObject(afSuccessPayloadString);
       if(afSuccessPayload.has(GuideConstants.REQUEST_PROPERTY_AEM_FORM_COMPONENT_PATH)) {
          String aemContainerPath = afSuccessPayload.getString(GuideConstants.REQUEST_PROPERTY_AEM_FORM_COMPONENT_PATH);
          formResource = slingRequest.getResourceResolver().getResource(aemContainerPath);
       }
       ValueMap props = formResource.getValueMap();

       String redirectUrl = null;
       if (jsonObject.has(GuideConstants.PROP_KEY_AF_SUCCESS_REDIRECT_URL)) {
           redirectUrl = jsonObject.getString(GuideConstants.PROP_KEY_AF_SUCCESS_REDIRECT_URL);
       }

       afSuccessPayload = new JSONObject(GuideSubmitUtils.getAFSuccessPayload(slingRequest, props, redirectUrl));
       jsonObject.put(GuideConstants.PROP_KEY_AF_SUCCESS_PAYLOAD, afSuccessPayload.toString());
    }

    out.println(jsonObject.toString());
%>
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
<%@page import="org.apache.sling.api.resource.ResourceUtil,
                com.adobe.cq.social.commons.CollabUtil,
                org.apache.sling.jcr.api.SlingRepository,
                org.apache.sling.api.resource.ValueMap,
                java.util.concurrent.atomic.AtomicInteger,
                org.slf4j.Logger,
                org.slf4j.LoggerFactory,
                org.apache.sling.jcr.base.util.AccessControlUtil,
                org.apache.jackrabbit.api.security.user.UserManager,
                com.adobe.aemds.guide.service.GuideStoreContentSubmission,
                javax.jcr.security.Privilege,
                java.util.HashMap,
                javax.jcr.Session,
                javax.jcr.Node,
                javax.jcr.security.AccessControlList,
                javax.jcr.security.AccessControlPolicyIterator,
                javax.jcr.security.AccessControlManager,
                javax.jcr.security.AccessControlPolicy,
                com.day.cq.commons.jcr.JcrUtil,
                com.adobe.aemds.guide.servlet.GuideSubmitServlet,
                com.adobe.aemds.guide.utils.GuideSubmitUtils,
                com.adobe.aemds.guide.utils.GuideConstants,
                com.day.cq.wcm.foundation.forms.FormsHelper" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<% final AtomicInteger uniqueIdCounter = new AtomicInteger();

%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%>
<%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<cq:defineObjects/><sling:defineObjects/>
<%

    final SlingRepository repository = sling.getService(SlingRepository.class);
    final ValueMap props = ResourceUtil.getValueMap(resource);

    String path = props.get(GuideConstants.STORE_PATH, "");
    // suppose the guide container dialog was not opened hence no default path was generated
    // then there path would be "" (no property for store path found)
    // This is only a fall back mechanism
    if (path.length() == 0) {
        // page path  should ideally be /content/forms/af
        final String pagePath = currentPage.getPath();
        if(StringUtils.startsWith(pagePath, GuideConstants.FM_AF_ROOT)) {
            final int pos = pagePath.indexOf('/', 1);
            // path in content (say /content/forms/af/BlaFolder/ ) + usergenerate/content + bhalAf + /*
            path = StringUtils.substring(pagePath, 0, pos + 1) + "usergenerated/content" + StringUtils.substring(pagePath, pos) + "/*";
        }

    }

    for (String suffix : new String[]{"/", "/*"}) {
        if (path.endsWith(suffix)) {
            final String uniqueId = System.currentTimeMillis() + "_" + uniqueIdCounter.addAndGet(1);
            path = path.substring(0, path.length() - suffix.length() + 1) + uniqueId;
            Session userSession = slingRequest.getResourceResolver().adaptTo(Session.class);
            if (CollabUtil.canAddNode(userSession, path)) {
                GuideStoreContentSubmission guideStoreContentSubmission = sling.getService(GuideStoreContentSubmission.class);
                // For custom path provided by author ,deny and allow permissions on other users
                // are not being provided.
                String guideStartParameter = request.getParameter(GuideConstants.REQUEST_PROPERTY_GUIDE_START);
                String authType = request.getAuthType();
                guideStoreContentSubmission.submissionForStoreContentUsingServiceUser(authType, userSession,guideStartParameter,path);
            } else {
                log.error("User does not have add_node permissions on {}", path);
            }
            break;
        }
    }

    GuideSubmitUtils.setForwardPath(slingRequest, path, null, null);

    Map<String, String> redirectParameters = GuideSubmitUtils.getRedirectParameters(slingRequest);
    if(redirectParameters==null) {
        redirectParameters = new HashMap<String, String>();
    }
    redirectParameters.put("contentPath", path);
    GuideSubmitUtils.setRedirectParameters(slingRequest, redirectParameters);
    //FormsHelper.runAction(props.get("actionType", ""), "abc", resource, request, response);
    slingRequest.setAttribute(GuideSubmitServlet.REQUEST_ATTR_WORKFLOW_PAYLOAD_PATH, path);

    // If a workflow model was specified, store it in
    // a request attribute for the StartWorkflowPostProcessor
    final String model = props.get("workflowModel", null);
    if (model != null) {
        slingRequest.setAttribute(GuideSubmitServlet.REQUEST_ATTR_WORKFLOW_PATH, model);
    }


%>

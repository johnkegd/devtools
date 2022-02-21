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
                org.slf4j.Logger,
                org.slf4j.LoggerFactory,
                com.day.cq.commons.jcr.JcrUtil" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideSubmitUtils" %>


<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%>
<%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<cq:defineObjects/><sling:defineObjects/>
<%
    GuideSubmitUtils.setForwardPath(slingRequest, resource.getPath(), ".af.mail.jsp", null);
%>

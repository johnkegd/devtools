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
<%@ page import="com.adobe.aemds.guide.utils.GuideConstants" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideUtils,
                 org.apache.sling.api.resource.Resource,
                 java.util.Iterator" %>
<body>
<%
    Iterator<Resource> children = resource.listChildren();
    boolean bIsGuideContainerRendered = false;
    while (children.hasNext()) {
        Resource child = children.next();
        // done to support AB Testing with static templates
        // delegate the call to tag lib to take care of which guide container to render in authoring
        if (GuideUtils.isGuideContainerResource(child)) {
            // check if a guide container is already rendered or not
            // if it is already rendered, then we don't render the guideContainer
            if (!bIsGuideContainerRendered) {
                // if not rendered, let's render it
                bIsGuideContainerRendered = true;
%>
<guide:includeGuideContainer/>
<%
    }
} else if (!GuideConstants.BLACKLIST_FROM_RENDER.contains(child.getName())) {
        //  BLACKLIST To avoid components who do not have renderers
%>
<sling:include resource="<%= child %>"/>
<%
        }
    }
%>
</body>

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
  Opens the bulkeditor
--%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %>
<%
%><sling:defineObjects/>
<%@ page import="java.net.URLEncoder,
                 org.apache.sling.api.resource.ResourceUtil,
                 org.apache.sling.api.resource.ValueMap" %>
<%
    final ValueMap properties = ResourceUtil.getValueMap(resource);
    final String nodePath = properties.get("nodePath", null);
    if (nodePath == null || nodePath.length() == 0) {
%>
<html>
<body>
<p>Please specify the node path property at <%= resource.getPath() %> to open the bulk editor.</p>
</body>
</html>
<%
    } else {
        final StringBuilder path = new StringBuilder(request.getContextPath());
        path.append(nodePath +".af.bulkeditor.jsp");
        response.sendRedirect(path.toString());
    }
%>

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
<%@ page import="java.util.Calendar" %><%
    String guideContainerPath = GuideELUtils.getGuideContainerPath(slingRequest, resource);
    Resource guideContainerResource = resourceResolver.resolve(guideContainerPath);
    String lang = GuideELUtils.getLocale(slingRequest, guideContainerResource);
    // We want these strings from the i18n/wcm/core and not from our bundle
    // These were extracted by the aemds job as we are using i18n.get here
    I18n i18n = new I18n(slingRequest.getResourceBundle(new Locale(lang)));
    int year = Calendar.getInstance().get(Calendar.YEAR);
%>
<div id="footer" class="bg-dk-grey hidden-xs">
      <div class="container">
        <p class="text-muted text-center text-white"><%= i18n.get("&copy; {0} Company name ", null, String.valueOf(year)) %>| All rights reserved</p>
      </div>
</div>

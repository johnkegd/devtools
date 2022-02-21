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
<%@page import="com.adobe.aemds.guide.utils.GuideConstants"%>
<%@page import="com.day.cq.wcm.api.components.IncludeOptions" %>
<%@ page import="com.adobe.aemds.guide.utils.GuideUtils" %>
<%
    String guideRef = properties.get("guideRef", null);
    boolean useExistingAf = properties.get("useExistingAF", true);
    Boolean isValidGuide = GuideUtils.isValidGuide(slingRequest, resource);
    if(guideRef != null && guideRef.length() != 0 && isValidGuide && useExistingAf) {
        guideRef = GuideUtils.guideRefToGuidePath(guideRef);
        // Disable the edit rollover for the guide Container Wrapper page
        IncludeOptions.getOptions(request, true).forceSameContext(Boolean.TRUE);   %>
        <cq:include path="<%= guideRef %>" resourceType="<%=GuideConstants.RT_GUIDECONTAINER %>"/>
<%  } else { %>
        <cq:include path="." resourceType="<%=GuideConstants.RT_GUIDECONTAINER %>"/>
<%    }    %>
<%
    if(guideRef != null && guideRef.length() != 0 && isValidGuide && useExistingAf){ %>
        <c:if test="${isEditMode}">
          <c:choose>
           <c:when test="<%= AuthoringUIMode.fromRequest(slingRequest) == AuthoringUIMode.CLASSIC%>">
            <script type="text/javascript">
              var intId = setInterval(function(){
                  //NOCHECKMARX - guideRef is coming from property preventing Reflective XSS All Clients.
                  var guideContainerPath = "<%=guideRef.concat("/*")%>",
                      guideEditables = CQ.WCM.getEditables(guideContainerPath);
                    _.each(guideEditables, function(item) {
                        if(item.path.substr(item.path.lastIndexOf("/")+1) !== "<%= GuideConstants.GUIDECONTAINER_NODENAME%>") {
                            item.disable();
                            item.hide();
                            clearInterval(intId);
                        }
                    });
              }, 1000);
            </script>
           </c:when>
           <c:otherwise>
               <script>
                   (function () {
                       //NOCHECKMARX - guideRef is coming from property preventing Reflective XSS All Clients.
                       var guideContainerPath = "<%=guideRef%>",
                               regex = new RegExp("^"+guideContainerPath),
                           parent$ = window.parent.$;
                       parent$(window.parent).off("cq-overlays-repositioned.existingaf")
                               .on("cq-overlays-repositioned.existingaf", function () {
                                   requestAnimationFrame(function () {
                                       var store = window.parent.Granite.author.editables;
                                       store.forEach(function (editable) {
                                           if (editable.path.match(regex)) {
                                               editable.setDisabled(true);
                                               var overlay = editable.overlay;
                                               if (overlay) {
                                                   overlay.setVisible(false);
                                               }
                                           }
                                       })
                                   });
                              });
                   }())
               </script>
           </c:otherwise>
          </c:choose>
        </c:if>
  <%  }%>
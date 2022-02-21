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
<guide:initializeBean name="guideField" className="com.adobe.aemds.guide.common.GuideListFileAttachmentButton"/>

<c:set var="guideContainerPath" value="${guide:getGuideContainerPath(slingRequest,resource)}" scope="page"/>
<c:set var="fileAttachmentList" value="${guide:getFileAttachmentList(slingRequest, guideContainerPath)}" scope="page"/>
<c:set var="index" value="0" scope="page"/>
<c:set var="size" value="${fn:length(fileAttachmentList)}" scope="page"/>
<c:if test="${size gt 0}">
    <div class="modal fade fileAttachmentDialog" id="fileAttachment" tabindex="-1" role="dialog" aria-label="Attachments" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Attachments</h3>
                </div>
                <div class="modal-body">
                    <div class="modal-list">
                    </div>
                </div><!-- /.modal-body -->
                <div class="modal-footer">
                    <div class="fileAttachmentListingCloseButton col-md-2 col-xs-2 col-sm-2">
                        <button data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</c:if>

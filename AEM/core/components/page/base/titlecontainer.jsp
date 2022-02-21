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
<%
    I18n i18n = new I18n(slingRequest);
%>
<div class="container">
	<div class="row assistance">
    	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-10 nopad-right panel-body nobrdbg">
            <% if(resource != null && resource.getChild("guideformtitle") != null) {%>
                <sling:include path="guideformtitle"/>
            <% } %>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 hidden-xs panel-body right-images nobrdbg text-center">
            <div class="row">
                <div class="col-md-3 hidden-sm hidden-xs nopad nobrdbg">
                    &nbsp;
                </div>
                <div class="col-lg-2 col-sm-2 col-xs-1 col-md-2 nopad">
                    &nbsp;
                </div>
                <div class="col-lg-2 col-sm-3 col-xs-3 col-md-2 nopad bg-link-green bordered">
                    <div>
                        <a href="#" id="terms" class="text-center">
                            <div class="terms icon"></div>
                            <div class="small"><%= i18n.get("Link 4") %></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-3 col-xs-3 col-md-2 nopad bg-link-maroon bordered">
                    <div>
                        <a href="#" class="text-center">
                            <div class="demo icon"></div>
                            <div class="small"><%= i18n.get("Link 5") %></div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-3 col-xs-3 col-md-2 nopad bg-link-blue bordered">
                    <div>
                        <a href="#" class="text-center form-help">
                            <div class="help icon"></div>
                            <div class="small"><%= i18n.get("Link 6") %></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-1 hidden-sm hidden-xs nopad nobrdbg">
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="col-xs-2 visible-xs pull-right text-right detail-toggle">
            <div class="btn-detail toggle icon" id="detail_click" data-toggle="collapse" data-target=".detail-collapse" alt=""></div>
        </div>
	</div>
</div>

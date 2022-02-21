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
<div class="navbar navbar-default navbar-fixed-top bg-blue" role="navigation" data-guide-position-class="guide-element-position-absolute">
    <div class="container">
        <div class="navbar-header col-xs-8 nopad iphone-pad" >
            <button type="button" class="navbar-toggle" data-toggle="collapse" id="menu_click" data-target=".navbar-collapse">
                <span class="sr-only"><%= i18n.get("Toggle navigation") %></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><%= i18n.get("Company logo") %></a>
        </div>
        <div class="col-md-3 col-xs-4 search-box nopad-left pull-right">
            <button type="button" class="menu-item-toggle visible-xs pull-right user" data-toggle="collapse" data-target="">
            </button>
            <div class="col-md-9 nopad nobrdbg pull-left hidden">
                <form role="search" action="" method="post">
                    <input type="search" name="s" id="s1" class="form-control" placeholder="search...">
                </form>
            </div>
            <button type="button" class="search-toggle pull-right hidden-xs" data-toggle="collapse" data-target=".search-slide">
                <span class="sr-only"><%= i18n.get("Toggle search") %></span>
            </button>

            <button type="button" class=" menu-item-toggle pull-right visible-xs search" data-toggle="collapse" data-target=".search-slide">
            </button>
            <button type="button" class="menu-item-toggle visible-xs pull-right fullscreen" data-toggle="collapse" data-target="">
            </button>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><img src="/etc.clientlibs/fd/af/runtime/clientlibs/guidetheme/common/resources/images/home.png" class="general-img hidden-lg hidden-md hidden-sm visible-xs" alt="<%= i18n.get("Alternate text for Link 1") %>"><%= i18n.get("Link 1") %></a></li>
                <li><a href="#"><img src="/etc.clientlibs/fd/af/runtime/clientlibs/guidetheme/common/resources/images/form.png" class="general-img hidden-lg hidden-md hidden-sm visible-xs" alt="<%= i18n.get("Alternate text for Link 2") %>"><%= i18n.get("Link 2") %></a></li>
                <li><a href="#"><%= i18n.get("Link 3") %></a></li>
            </ul>
        </div>
    </div>
</div>
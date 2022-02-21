/*******************************************************************************
 * ADOBE CONFIDENTIAL
 * ___________________
 * Copyright 2018 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and are protected by all applicable intellectual property
 * laws, including trade secret and copyright laws.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 ******************************************************************************/
// do not use _ here.
(function (channel, ns) {

    var _superSanitizeCQHandler = ns.util.sanitizeCQHandler,
        _superExecuteListener = ns.Editable.prototype._executeListener;
    // adding hook for CQ Sanitize handler
    ns.util.sanitizeCQHandler = function (code) {
        // check if the handler belongs to form editor
        // code can be a function or a string, in case of form editor, for OOTB edit config listeners, we need to check for listeners prefixed with guidelib or guidelib.author
        if (window.guidelib == null && code != null && typeof code === 'string' &&  (code.indexOf("guidelib") === 0 || (code.indexOf("guidelib.author"))) >= 0) {
            // in case of an aem form handler, do nothing
        } else if (code && typeof code === "function") {
            return code;
        } else {
            return _superSanitizeCQHandler.call(this, code);
        }
    };

    // adding hook for execute listener
    // since on wcmmode preview, we dont have authoring code of form editor loaded in site editor
    ns.Editable.prototype._executeListener = function (listenerName, parameters) {
        if (this.config && this.config.editConfig.listeners[listenerName] == null && parameters && parameters[0].indexOf("guideContainer") >= 0) {
            // do nothing
        } else {
            return _superExecuteListener.call(this, listenerName, parameters);
        }
    };

    // once the layer is switched, check if AEM form component exists in the page
    // if aem form component exists, then refresh the page, so that we can show the test data in wcmmode preview
    channel.on("editor-frame-mode-changed.aemform", function () {
        if (window.fd.aemFormExistsInPage()) {
            // check if the cookie is wcmmode preview
            var wcModeCookie = $.cookie("wcmmode");
            if (wcModeCookie == "preview" || wcModeCookie == "edit") {
                // reload the page
                window.location.reload();
            }
        }
    });

}($(document), Granite.author));

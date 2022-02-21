/*******************************************************************************
 * ADOBE CONFIDENTIAL
 * ___________________
 * Copyright 2016 Adobe Systems Incorporated
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
(function () {
    window.fd = window.fd || {};
    window.fd.constants = window.fd.constants || {};
    window.fd.constants = {
        "AEM_FORM_SELECTOR" : "[data-form-page-path]"
    };

    window.fd.openFormForEditing = function (editable) {
        var htmlElement = $(window.fd.constants.AEM_FORM_SELECTOR, editable.dom).addBack("[data-form-page-path]"),
            formPath = htmlElement.attr("data-form-page-path"),
            url = Granite.HTTP.externalize("/editor.html" + formPath + ".html");
        window.open(url);
    };

    window.fd.formExists = function (editable) {
        return $(window.fd.constants.AEM_FORM_SELECTOR, editable.dom).addBack(window.fd.constants.AEM_FORM_SELECTOR).length > 0;
    };

    window.fd.aemFormExistsInPage = function () {
        return Granite.author.store.find({"type" : "fd/af/components/aemform"}).length > 0;
    };

}());

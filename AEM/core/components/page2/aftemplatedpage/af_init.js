/*
 * ADOBE CONFIDENTIAL
 *
 * Copyright 2019 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 */

/**
 * Initializes Adaptive form metadata information
 */
"use strict";
var global = this;
(function () {
    if (global.Packages) {
        var guideContainerPath = global.Packages.com.adobe.aemds.guide.taglibs.GuideELUtils.getGuideContainerPath(request, resource);
        if (guideContainerPath) {
            var formDAMAssetMetadataPath = global.Packages.com.adobe.aemds.guide.utils.GuideUtils.convertGuideContainerPathToFMAssetMetadataPath(guideContainerPath);
            var formMetadataResource = request.getResourceResolver().getResource(formDAMAssetMetadataPath);
            if (formMetadataResource) {
                var metadata = formMetadataResource.adaptTo(global.Packages.org.apache.sling.api.resource.ValueMap);
                var creatorTool = metadata.get(global.Packages.com.adobe.aemds.guide.utils.GuideConstants.FM_DAM_FD_GENERATOR, global.Packages.com.adobe.aemds.guide.utils.GuideConstants.FM_DAM_DEFAULT_GENERATOR);
            }
        }
    }
    return {
        creatorTool : creatorTool
    };
})();

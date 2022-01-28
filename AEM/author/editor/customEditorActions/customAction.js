(function ($, ns, channel, window, undefined) {
    "use strict";

    /**
     *
     * Dependencies
     *
     */

    var EditorFrame = ns.EditorFrame;

    /**
     *
     * Constants
     *
     */

    var ACTION_ICON = "coral-Icon--camera";
    var ACTION_TITLE = "Screenshot";
    var ACTION_NAME = "SCREENSHOT";
    var PROPERTIES_TO_DELETE = ["jcr:created", "jcr:lastModified"];
    var componentCategory = "apps/forms/components/component";

    /**
     *
     * Internals
     *
     */

    /**
     * Defines the "Screenshot" Toolbar Action
     *
     * @type Granite.author.ui.ToolbarAction
     * @alias SCREENSHOT
     */

    var screenshotAction = new ns.ui.ToolbarAction({
        name: ACTION_NAME,
        icon: ACTION_ICON,
        text: ACTION_TITLE,
        execute: function (editable) {
            html2canvas(editable.dom, {
                onrendered: function (canvas) {
                    var img = canvas.toDataURL();
                    window.open(img);
                }
            });
        },
        condition: function (editable) {
            return !!(editable && editable.dom);
        },
        isNonMulti: true
    });

    /**
     *
     * Hooks
     *
     */

    // When the Edit Layer gets activated
    channel.on("cq-layer-activated", function (event) {
        if (event.layer === "Edit") {
            // Register an additional action
            EditorFrame.editableToolbar.registerAction(ACTION_NAME, screenshotAction);
        }
    });

    ns.edit.EditableActions.UPDATE = new ns.ui.EditableAction({
        execute: function doUpdate(editable, properties) {
            if (editable.type === componentCategory) {
                var heading = $(properties["./_value"]);
                var pt = null;
                switch (true) {
                    case heading.is('p'):
                        pt = "24pt";
                        break;
                    case heading.is('h2'):
                        pt = "20pt";
                        break;
                    case heading.is('h3'):
                        pt = "16pt";
                        break;
                    case heading.is('h4'):
                        pt = "12pt";
                        break;
                }
                if (!(heading.length > 1)) {
                    var paragraph = $('<p>' + heading.text() + '</p>');
                    paragraph.css('font-size', pt);
                    heading.css('font-size', pt);
                    if (heading.is('p')) {
                        properties["./_value"] = heading[0].outerHTML;
                    } else {
                        properties["./_value"] = paragraph[0].outerHTML;
                    }
                }
            }
            var self = this
                , deferred = $.Deferred()
                , editableParent = ns.editables.getParent(editable);
            Object.keys(properties).forEach(function (key) {
                var value = properties[key];
                var prefixedKey = key.replace(/^(.\/)?/, "./");
                if (PROPERTIES_TO_DELETE.includes(key) || PROPERTIES_TO_DELETE.includes(prefixedKey)) {
                    delete properties[key];
                } else if (key !== prefixedKey) {
                    delete properties[key];
                    properties[prefixedKey] = value
                }
            });

            function updateFunction() {
                ns.persistence.updateParagraph(editable, properties).fail(function (jqXHR) {
                    var customResponse = $(jqXHR.responseText).filter("title").text();
                    var errorMessage = customResponse.substr(customResponse.indexOf(" ")).trim();
                    if (errorMessage) {
                        ns.edit.EditableActions.REFRESH.execute(editable, properties);
                        ns.ui.helpers.notify({
                            content: Granite.I18n.get(errorMessage),
                            type: ns.ui.helpers.NOTIFICATION_TYPES.ERROR
                        })
                    }
                    ns.edit.EditableActions.REFRESH.execute(editable, properties).done(function () {
                        deferred.resolve()
                    })
                }).then(function () {
                    ns.edit.EditableActions.REFRESH.execute(editable).then(self._postExecute(editable, editableParent, deferred))
                });
                return deferred.promise()
            }

            if (editable.beforeEdit(updateFunction, properties) === false || editableParent && editableParent.beforeChildEdit(updateFunction, properties, editable) === false) {
                return $.Deferred().reject();
            } else {
                return ns.editableHelper.overlayCompleteRefresh(updateFunction())
            }
        },
        _postExecuteJSON: function (editable, editableParent, deferred) {
            deferred.resolve(editable)
        },
        _postExecuteHTML: function (editable, editableParent, deferred) {
            editable.afterEdit();
            editableParent && editableParent.afterChildEdit(editable);
            ns.overlayManager.recreate(editable);
            deferred.resolve(editable)
        },
        condition: function (editable) {
            return ns.pageInfoHelper.canModify() && editable.hasAction("EDIT") && !(editable.isStructure() && editable.isStructureLocked())
        }
    });

}(jQuery, Granite.author, jQuery(document), this));
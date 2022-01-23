window.aem.forms.utils = window.aem.forms.utils || {};
(function (context) {
     /**
     * Return all inputs fields, We go recursively through the steps objects children
     * @param  {Object|string} - The object or string(somExpression) with the context of the node to iterate
     * @return  Object - with the inputs total, mandatory and not mandatory fields
     */
    context.getInputFields = function (root) {
        if (!root || typeof root === "number") {
            console.warn("getInputFields: not somExpression or context provided, taking rootPanel as root");
            root = guideBridge._guide.rootPanel.navigationContext._getNavigableItems();
        }
        var mandatoryFields = [];
        var noMandatoryFields = [];
        var node = Array.isArray(root) ? {_children: root} : (typeof root === "string") ? guideBridge.resolveNode(root) : root;

        if (node._children) {
            (function iterateNodes(node) {
                if (node._children) {
                    node._children.forEach(function (children) {

                        switch (true) {
                            case children instanceof guidelib.model.GuideInstanceManager :
                                break;
                            case children instanceof guidelib.model.GuideTextDraw :
                                break;
                            case children instanceof guidelib.model.GuideImage :
                                break;
                            case children instanceof guidelib.model.GuideToolbar :
                                break;
                            case children instanceof guidelib.model.GuideButton :
                                break;
                            case children.name === "carouselPreview" :
                                break;
                            case children.mandatory !== undefined :
                                if (children.mandatory === true && !(mandatoryFields.includes(children))) {
                                    mandatoryFields.push(children);
                                } else if (!(noMandatoryFields.includes(children))) {
                                    noMandatoryFields.push(children);
                                }
                                break;
                            default :
                                iterateNodes(children);
                                break;
                        }
                    });
                }
            }(node));
        } else {
            console.warn("getInputFields: not children found in object to iterate");
            return;
        }

        return {
            inputs: mandatoryFields.concat(noMandatoryFields),
            mandatory: mandatoryFields,
            notMandatory: noMandatoryFields,
        };
    }


    context.getMandatoryFields = function (somExpression) {
        var result = context.getInputFields(somExpression);
        return result.mandatory;
    }

    context.getNotMandatoryFields = function (somExpression) {
        var result = context.getInputFields(somExpression);
        return result.notMandatory;
    }

    context.getRootPanelInputFields = function () {
        var rootPanelSom = guideBridge._guide.rootPanel.somExpression;
        var result = context.getInputFields(rootPanelSom);
        var joinedResult = [];
        //those lines cause an error in author page when trying to open the rule editor
        // if ((result.mandatory.length + result.notMandatory.length) > 0) {
        //     joinedResult.push(...result.mandatory);
        //     joinedResult.push(...result.notMandatory);
        // }
        return joinedResult;
    }

    /**
     * Search control elements in the specific node or rootPanel as default
     * @param somExpression -   The String to be resolved by guideBridge
     * @return controlElements -    The Array containing the list of control elements
     */
    context.getControlElements = function (somExpression) {
        var inputFields = null;
        var controlElements = [];
        if (somExpression) {
            inputFields = context.getInputFields(somExpression);
        } else {
            inputFields = context.getRootPanelInputFields();
        }
        inputFields.forEach(function (somNode) {
            var node = guideBridge.resolveNode(somNode);
            if (node.controlElement) {
                controlElements.push(node._getSomExpression());
            }
        });
        return controlElements;
    }

        context.setMandatoryFields = function (fields, mandatory) {
        if (fields) {
            if (mandatory) {
                if (fields.length > 0) {
                    fields.forEach(function (field) {
                        field.mandatory = true;
                    });
                }
            } else {
                if (fields.length > 0) {
                    fields.forEach(function (field) {
                        field.mandatory = false;
                    });
                }

            }
        }
    }

})(window.aem.forms.utils);
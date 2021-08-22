// var setNewGuideData = function () {
//     guideBridge.setData({
//         guideState: jsonData,
//         sucess: function (data) {
//             console.log("new data sucess: ", data);
//         },
//         error: function (error) {
//             console.error("error while setting new data: ", error);
//         }
//     });
// }


// var getReducedData = 
// guideBridge.getGuideState({
//      success : function (guideResultObj) {
//          jsonData = guideResultObj.data;
//          console.log(JSON.stringify(jsonData,null,2));
//      },
//      error : function (guideResultObj) {
//          // log error
//      },
//      reducedJSON: true
// });

// var getGuideStatus = guideBridge.getGuideState({
//      success : function (guideResultObj) {
//          jsonData = guideResultObj.data;
//          console.log(JSON.stringify(jsonData,null,2));
//      },
//      error : function (guideResultObj) {
//         // log error
//      },
//      reducedJSON: true
// });

class HelperComponentsCheckService {
    fillUploadComponents = false;
    type = {
        CHECKBOX: "checkbox",
        TEXTBOX: "textbox",
        EMAIL: "email",
        NUMERICBOX: "numericbox",
        DROPDOWNLIST: "dropdownlist",
        RADIOBUTTON: "radiobutton",
        DATEPICKER: "datepicker",
        FILEUPLOAD: "fileupload",
        TELEPHONE: "telephone",
    };
    CHECKINPUT = HelperVariableCheckService;
    counter = 0;
    constructor() {

        // HelperVariableCheckService.getHiddenComponents(this);
    }

    static getSomList() {
        var help = new HelperComponentsCheckService();
        var somList = [];
        var somValidations = [];
        help.helperGetGuideBridge().validate(somValidations);
        if (somValidations.length != 0) {
            somValidations.forEach(function (item) {
                somList.push(item.som);
            });
        }
        return somList;
    }

    initFillForm() {
        var somList = HelperComponentsCheckService.getSomList();
        var valuesResult = this.getValues(somList);
        if (this.CHECKINPUT.isNotNull(valuesResult[0]) && !this.CHECKINPUT.isUndefined(valuesResult[0])) {
            this.helperSetElementsProperty("value", somList, valuesResult);
        } else {
            console.log("initFillForm: valuesList is empty");
            return null;
        }
    }

    getValues(somList) {
        var valuesResult = [];
        var componentsList = [];
        try {
            var guideResultObject = this.helperGetElementsProperty("options", somList);
            if (this.CHECKINPUT.isNotNull(guideResultObject.data) && !this.CHECKINPUT.isUndefined(guideResultObject.data)) {
                for (var i = 0; i < guideResultObject.data.length; i++) {
                    var componentData = guideResultObject.data[i].jsonModel;
                    valuesResult.push(this.getElementValue(componentData));
                }
            } else {
                throw Error("Error while helperGetValues");
            }
        } catch (error) {
            console.error(error);
        }
        return valuesResult;
    }

    getElementValue(componentData) {
        try {
            var componentType = componentData["sling:resourceType"].substring(componentData["sling:resourceType"].lastIndexOf("/") + 1);
            switch (componentType) {
                case this.type.CHECKBOX:
                    if (!this.CHECKINPUT.isUndefined(componentData.options)) {
                        return componentData.options[0].substring(0, componentData.options[0].lastIndexOf("="));
                    }
                    break;
                case this.type.TEXTBOX:
                    //                     if (!this.CHECKINPUT.isUndefined(componentData.displayPictureClause)) {
                    //                         var valuePattern = componentData.displayPictureClause;
                    //                         return valuePattern.substring(valuePattern.lastIndexOf("{") + 1, valuePattern.length - 1);
                    //                     } else if (!this.CHECKINPUT.isUndefined(componentData.shortDescription)) {
                    //                         if (componentData.shortDescription.search("41") != -1 || componentData.shortDescription.search("000") != -1) {
                    //                             return "+41 00 000 00 00";
                    //                         }
                    //                     }
                    return "Text example";
                    break;
                case this.type.NUMERICBOX:
                    var value = null;
                    //if(this.CHECKINPUT.isNotNull(componentData.displayPictureClause)){}
                    return "5645";
                    break;
                case this.type.EMAIL:
                    return "john@mail.com";
                    break;
                case this.type.DROPDOWNLIST:
                    if (!this.CHECKINPUT.isUndefined(componentData.options)) {
                        var value = this.helperCheckComponentOptions(componentData.options, "=");
                        return value;
                    }
                    break;
                case this.type.DATEPICKER:
                    var datePattern;
                    var value;
                    var dateReplace = new Date().toISOString();
                    //                     if (!this.CHECKINPUT.isUndefined(componentData.validatePictureClause) && this.CHECKINPUT.isNotNull(componentData.validatePictureClause)) {
                    //                         if (componentData.validatePictureClause.search("date") === 0) {
                    //                             datePattern = componentData.validatePictureClause.substring(componentData.validatePictureClause.lastIndexOf("{") + 1, componentData.validatePictureClause.length - 1);
                    //                             datePattern = (datePattern.search("YYYY") != -1) ? datePattern.replace("YYYY", "2021") : datePattern.replace("YY", 21);
                    //                             datePattern = (datePattern.search("MM") != -1) ? datePattern.replace("MM", "02") : datePattern.replace("M", "2");
                    //                             datePattern = (datePattern.search("DD") != -1) ? datePattern.replace("DD", "18") : datePattern.replace("D", "2");
                    //                             value = datePattern.replaceAll("-", "."); 
                    //                         }
                    //                     }
                    return dateReplace.slice(0, dateReplace.lastIndexOf("T"));
                    break;
                case this.type.RADIOBUTTON:
                    var value = null;
                    if (!this.CHECKINPUT.isUndefined(componentData.valueCommitScript)) {
                        componentData.options.forEach(function (option) {
                            option = option.substring(0, option.lastIndexOf("="));
                            if (option === "true" && option === "yes" && option === "accept") {
                                value = option;
                                return value;
                            }
                        });
                    }
                    if (this.CHECKINPUT.isNull(value)) {
                        value = componentData.options[0].substring(0, componentData.options[0].lastIndexOf("="));
                    }
                    return value;
                    break;
                case this.type.FILEUPLOAD:
                    if (this.fillComponents()) {
                        return JSON.stringify([{ "name": "Template.pdf", "uuid_upload": "176f5ecd-e730-484d-8cbc-a65411d7f848", "uuid": "e337026b-2aeb-4b34-a7af-32d6a35523be", "category": "", "categoryName": "", "comment": "" }]);
                    } else {
                        this.type.FILEUPLOAD = "skip";
                        console.log("so skip fileupload components");
                    }

                    break;
                case this.type.TELEPHONE:
                    return "+41000000000";
                default:
                    console.log("unknown component type: ", componentType);
                    break;
            }

        } catch (error) {
            console.error("Error while getElementValue: ", error);
        }
    }

    fillComponents() {
        if (!this.fillUploadComponents) {
            var deactiveParamters = ["no", "nein", "non", "n", "false"]
            var optionSelected = prompt('fill fileUploads', false);
            if (deactiveParamters.includes(optionSelected)) {
                this.fillUploadComponents = true;
                return false;
            } else {
                this.fillUploadComponents = true;
                return this.fillUploadComponents;
            }
        } else {
            this.fillUploadComponents = true;
            return this.fillUploadComponents;
        }
    }

    helperGetGuideBridge() {
        try {
            return window.guideBridge;
        } catch (error) {
            console.error("Error while getGuideBridge: ", error);
            throw Error();
        }
    }

    helperGetElementsProperty(propertyName, somExpressions) {
        var guideResultObject = this.helperGetGuideBridge().getElementProperty({
            propertyName: propertyName,
            somExpressions: somExpressions
        });
        if (guideResultObject.errors) {
            var errors = guideResultObject.getNextMessage();
            while (errors != null) {
                console.warn("Errors found in response helperGetElementProperty: ", errors);
            }
        }
        return guideResultObject;
    }

    helperSetElementsProperty(propertyName, somExpressions, valuesList) {
        if (this.CHECKINPUT.isArray(somExpressions) && this.CHECKINPUT.isString(propertyName)) {
            this.helperGetGuideBridge().setProperty(somExpressions, propertyName, valuesList);
            // this.helperCheckUpdates(propertyName, somExpressions, value);
        } else {
            console.error("helperSetElementsProperty is expecting propertyName as String and SomExpressions as Array", propertyName, somExpressions);
        }
    }

    helperCheckUpdates(propertyName, somExpressions, value) {
        var guideResultObject;
        /* TODO
         *  option to check updates from instance fields guideResultObject
         */
        try {
            guideResultObject = this.helperGetElementsProperty(propertyName, somExpressions);
            if (this.CHECKINPUT.isNotNull(guideResultObject.data[0]) && this.CHECKINPUT.isUndefined(guideResultObject.data[0]) != true) {
                if (this.CHECKINPUT.isString(guideResultObject.data[0])) {
                    return value.toLocaleLowerCase() === guideResultObject.data[0].toLocaleLowerCase();
                } else {
                    if (this.CHECKINPUT.isObject(guideResultObject.data[0].jsonModel)) {
                        var jsonModel = guideResultObject.data[0].jsonModel;
                        for (var [k, v] of Object.entries(jsonModel)) {
                            if (v.toLocaleLowerCase() === value) {
                                console.log("helperCheckUpdates: Updates correct");
                                return true;
                            }
                        }
                    }
                }
            } else {
                console.log(`helperCheckUpdates: cannot found ${value} changes in ${guideResultObject}`);
            }
        } catch (error) {
            console.error("Error while helperCheckUpdates: ", error);
        }
    }

    helperCheckComponentOptions(componentOptions, separator) {
        var option = null;
        if (this.CHECKINPUT.isArray(componentOptions)) {
            option = (componentOptions[0].search(separator) != -1) ? componentOptions[0].split(separator)[0] : componentOptions[0];
        } else if (this.CHECKINPUT.isString(componentOptions)) {
            option = componentOptions.split(separator)[0];
        }
        return option;
    }

    helperRetry() {
        this.rounds--;
        clearTimeout(this.rounds);
    }
};

class HelperVariableCheckService {
    constructor() { }
    /**
     *
     *
     * @param: variable to check
     *
     * @return: data type and !Important: throw error in console if the data hold null or undefined values
     */
    static checkType(args) {
        var type = null;
        var getType = function (item) {
            var checkedType = typeof item;
            switch (checkedType) {
                case "string":
                    type = checkedType;
                    break;
                case "number":
                    type = checkedType;
                    break;
                case "boolean":
                    type = checkedType;
                    break;
                case "object":
                    if (Array.isArray(item)) {
                        type = "array";
                    } else if (item instanceof Map) {
                        type = "map";
                    } else if (item instanceof Set) {
                        type = "set";
                    } else {
                        type = checkedType;
                    }
                    break;
                case "undefined":
                    type = checkedType;
                    throw Error();
            }
        }

        try {
            if (args === null) {
                throw Error();
            } else {
                getType(args);
            }
        } catch (warn) {
            // console.warn("Warning while variableCheck: ", warn, " DATA TYPE: ", type);
        }
        return type;
    }

    static isNumber(item) {
        return (this.checkType(item) === "number") ? true : false;
    }
    static isString(item) {
        return (this.checkType(item) === "string") ? true : false;
    }
    static isArray(item) {
        return (this.checkType(item) === "array") ? true : false;
    }
    static isMap(item) {
        return (this.checkType(item) === "map") ? true : false;
    }
    static isSet(item) {
        return (this.checkType(item) === "set") ? true : false;
    }
    static isObject(item) {
        return (this.checkType(item) === "object") ? true : false;
    }
    static isUndefined(item) {
        return (this.checkType(item) === "undefined") ? true : false;
    }
    static isNull(item) {
        return (this.checkType(item) === null) ? true : false;
    }
    static isNotNull(item) {
        return (!this.isNull(item)) ? true : false;
    }
    static isBoolean() {
        return (this.checkType(item)) ? true : false;
    }
    static getHiddenComponents(initator) {
        guideBridge.on("elementVisibleChanged", function (event, payload) {
            var component = payload.target;
            var newValue = payload.newText;
            if (newValue) {
                initator.initFillForm();
            }
        });
    }
    static validatioStatusCheck(event, payload, counter) {
        var component = payload.target;
        //TODO displayPatterns detection
        try {
            if (component.jsonModel.displayPictureClause.search("currency") != -1) {
                guidelib.i18n.numberSymbols.grouping = "'";
                component.jsonModel.displayPictureClause = component.jsonModel.displayPictureClause.replace("currency", "num").replaceAll("'", ",");
                component._triggerDisplayFormatChange(component.value);
            }
        } catch (e) {

        }
        if (!component.isValid && !(counter > 2)) {
            initator.initFillForm();
            counter++;
        }
    }
};

/**
 *
 *
 * @param: Object or Json
 *
 * @return: 
 */
var helperObjectIterator = function (item) {
    try {
        // HelperVariableCheckService.checkedType(item);
        iterateObj();

        function iterateObj() {
            Object.keys(item).forEach(function (key) {
                console.log("Object [key,value]: ", "[", key, ",", item[key], "]");
                if (typeof item[key] === "object") {
                    iterateObj(item[key]);
                }
            });
        }
    } catch (error) {
        console.warn("Error while iterateObj: ", error);
    }
};


(function () {
    var counter = 0;
    var initiator = new HelperComponentsCheckService();
    initiator.initFillForm();

    //     guideBridge.on("elementValidationStatusChanged",function (event, payload) {
    //         HelperVariableCheckService.validatioStatusCheck(event, payload);
    //     });

})();
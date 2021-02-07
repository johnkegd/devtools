var fillDataKeys = function (fieldsKeysCollection) {
    fieldsKeysCollection = guideBridge.validate(fieldsKeysCollection);
    if (fieldsKey.length != -1) {
        fieldsKey.forEach(function (item) {

        });
    }
}

var init = function (item) {
    guideBridge.getGuideState({
        sucess: function (guideResultObj) {
            item = guideResultObj;
            handleData();
        },
        error: function (error) {
            console.log("error while get guideData", error);
        }
    });
}

var setNewGuideData = function () {
    guideBridge.setData({
        guideState: jsonData,
        sucess: function (data) {
            console.log("new data sucess: ", data);
        },
        error: function (error) {
            console.error("error while setting new data: ", error);
        }
    });
}

var handleData = function () {
    try {
        var panelItems = jsonData.guideState.guideDom.rootPanel.items;


    } catch (error) {
        console.error("error while reading jsonData results: ", error);
    }
}

/* var getSomList = function (validatedData) {
    var somList = [];
    try {
        HelperVariableCheckService.isNotNull(validatedData);
        validatedData.forEach(function (item) {
            somList.push(item.som);
        });
    } catch (error) {
        console.error("Error while getSomList: ", error);
    }
    return somList;
}
 */

var setPropertiesNames = function (somList, propName) {
    var result = guideBridge.getElementProperty({
        propertyName: propName,
        somExpression: somList
    });
    if (result.errors) {
        var error = result.getNextMessage();
        while (error != null) {
            console.log("Errors trying getElementProperty", error.message);
        }
    }

    return propertiesNames;
}

var setValuesList = function () {

}

var setFormProperties = function (somList, propertiesNames, valueList) {

}


class HelperComponentsCheckService {
    type = {
        CHECKBOX: "checkbox",
        TEXTBOX: "textbox",
        EMAIL: "email",
        NUMERICBOX: "numericbox",
        DROPDOWNLIST: "dropdownlist",
        RADIOBUTTON: "radiobutton",
        DATEPICKER: "datepicker",
    };
    CHECKINPUT = HelperVariableCheckService;
    constructor() {}
    /* TODO
    * slice complex function
    **/
    static initFillForm() {
        var help = new HelperComponentsCheckService();
        var somList = this.getSomList();
        var valuesList = [];
        try {
            var guideResultObject = help.helperGetElementsProperty("options", somList);
            if (help.CHECKINPUT.isNotNull(guideResultObject.data) && !help.CHECKINPUT.isUndefined(guideResultObject.data)) {
                for(var i=0; i < guideResultObject.data.length; i++) {
                    var componentData = guideResultObject.data[i].jsonModel;
                    valuesList.push(help.helperSetComponentValue(componentData));
                }
            } else {
                throw Error("Error while initFillForm");
            }
        } catch (error) {
            console.error(error);
        }
        help.helperSetElementsProperty("value", somList, valuesList);
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

    helperSetComponentValue(componentData) {
        try {
            var componentType = componentData["sling:resourceType"].substring(componentData["sling:resourceType"].lastIndexOf("/") + 1);
            switch(componentType) {
                case this.type.CHECKBOX : 
                    if(!this.CHECKINPUT.isUndefined(componentData.options)) {
                        return componentData.options[0].substring(0, componentData.options[0].lastIndexOf("="));
                    }
                break;
                case this.type.TEXTBOX : 
                    if(componentData.shortDescription.search("41") != -1 || componentData.shortDescription.search("000") != -1) {
                        return "+41 00 000 00 00";
                    } else {
                        return "text example";
                    }
                    /* TODO
                    * check displayPictureClause to set textbox
                     */
                break;
                case this.type.NUMERICBOX : 
                    var value = null;
                    //if(this.CHECKINPUT.isNotNull(componentData.displayPictureClause)){}
                    return "123456";
                break;
                case  this.type.EMAIL : 
                    return "example@mail.com";
                break;
                case this.type.DROPDOWNLIST : 
                    return componentData.options[0];
                break;
                case this.type.DATEPICKER :
                    var datePattern;
                    var value;
                    if(!this.CHECKINPUT.isUndefined(componentData.validatePictureClause) && this.CHECKINPUT.isNotNull(componentData.validatePictureClause)) {
                        if(componentData.validatePictureClause.search("date") === 0) {
                            datePattern = componentData.validatePictureClause.substring(componentData.validatePictureClause.lastIndexOf("{") + 1, componentData.validatePictureClause.length -1);
                            datePattern = (datePattern.search("YYYY") === 0) ? datePattern.replace("YYYY","2021") : datePattern.replace("YY",21);
                            datePattern = (datePattern.search("MM") === 0) ? datePattern.replace("MM","02") : datePattern.replace("M","2");
                            datePattern = (datePattern.search("DD") === 0) ? datePattern.replace("DD","18") : datePattern.replace("D","2");
                            value = datePattern.replaceAll("-",".");
                            return value;                            
                        }
                    } 
                break;
                case this.type.RADIOBUTTON :
                    var value = null;
                    if(!this.CHECKINPUT.isUndefined(componentData.valueCommitScript)) {
                       componentData.options.forEach(function(option){
                           option = option.substring(0, option.lastIndexOf("="));
                            if(option != "true" && option != "yes" && option != "accept") {
                                value = option;
                                return;
                            } 
                       });
                       if (this.CHECKINPUT.isNull(options)) {
                        value = componentData.options[0].substring(0, componentData.options[0].lastIndexOf("="));
                       }
                       return value;
                    }
                break;
                default :
                    console.log("unkow component type: ", componentType);
                break;
            }
            
        } catch (error) {
            console.error("Error while helperCheckComponentsType: ", error);
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
}

class HelperVariableCheckService {
    constructor() {}
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
            console.warn("Warning while variableCheck: ", warn, " DATA TYPE: ", type);
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
}
/**
 *
 *
 * @param: Object or Json
 *
 * @return: 
 */
var helperObjectIterator = function (item) {
    try {
        HelperVariableCheckService.checkedType(item);
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
}


// (function(){
//     if(guideBridge != null & guideBridge != undefined) {

//         var fieldsKeysCollection = [];
//         var jsonData;
//         var newData;

//     }

//    })();
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
    constructor() {}
    /* TODO
    * slice complex function
    **/
    static checkFormComponentsType() {
        var help = new HelperComponentsCheckService();
        var checkInput = HelperVariableCheckService;
        var map = new Map();
        var somList = this.getSomList();
        var valuesList = [];
        var guideResultObject = help.helperGetElementsProperty("options", somList);
        var types = {
            checkbox: "checkbox",
            textbox: "textbox",
            email: "email",
            numberbox: "numberbox",
            dropdownlist: "dropdownlist",
            radiobutton: "radiobutton",
            datepicker: "datepicker",
        };
        if (checkInput.isNotNull(guideResultObject.data[0])) {
            for(var i=0; i < guideResultObject.data.length; i++) {
                var jsonModel = guideResultObject.data[i].jsonModel;
                if (!checkInput.isUndefined(jsonModel.options)) {
                    map.set(somList[i],jsonModel.options[0]);
                    valuesList.push(jsonModel.options[0]);
                } else if (!checkInput.isUndefined(jsonModel.displayPictureClause)) {
                    var validationPattern = jsonModel.displayPictureClause;
                    validationPattern = validationPattern.substring(validationPattern.lastIndexOf("{") + 1, validationPattern.lastIndexOf("}"));
                    map.set(somList[i], validationPattern);
                    valuesList.push(validationPattern);
                } else if (!checkInput.isUndefined(jsonModel.yearRangeFrom) && checkInput.isNotNull(jsonModel["{default}"])) {
                    var dateDefaultPattern = jsonModel["{default}"].replace("dd","18").replace("mm", "02").replace("yyy", new Date().getFullYear().toString());
                    map.set(somList[i], dateDefaultPattern);
                    valuesList.push(dateDefaultPattern);
                } else {
                    valuesList.push("Johnkegd" + i);
                }
            }
        } else {
            throw Error("checkFormComponentsType: NullPointer Error");
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
        var checkInputs = HelperVariableCheckService;
        if (checkInputs.isArray(somExpressions) && checkInputs.isString(propertyName)) {
            this.helperGetGuideBridge().setProperty(somExpressions, propertyName, valuesList);
           // this.helperCheckUpdates(propertyName, somExpressions, value);
        } else {
            console.error("helperSetElementsProperty is expecting propertyName as String and SomExpressions as Array", propertyName, somExpressions);
        }
    }

    helperCheckUpdates(propertyName, somExpressions, value) {
        var guideResultObject;
        var checkInputs = HelperVariableCheckService;
        /* TODO
         *  option to check updates from instance fields guideResultObject
         */
        try {
            guideResultObject = this.helperGetElementsProperty(propertyName, somExpressions);
            if (checkInputs.isNotNull(guideResultObject.data[0]) && checkInputs.isUndefined(guideResultObject.data[0]) != true) {
                if (checkInputs.isString(guideResultObject.data[0])) {
                    return value.toLocaleLowerCase() === guideResultObject.data[0].toLocaleLowerCase();
                } else {
                    if (checkInputs.isObject(guideResultObject.data[0].jsonModel)) {
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
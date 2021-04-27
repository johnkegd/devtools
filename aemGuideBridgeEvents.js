(function(){
    init();
    
       function init(){
            var helperOption = prompt("1. elementValueChanged \n2. elementFocusChanged \n3. elementVisibleChanged \n4. elementNavigationChanged \n5. elementValidationStatusChanged \n0. ALL"); 
              switch(helperOption) {
                   case "1" : 
                       elementValueChanged();
                   break;
                   case "2" :
                       elementFocusChanged();
                   break;
                   case "3" : 
                       elementVisibleChanged();
                   break;
                   case "4" :
                       elementNavigationChanged();
                   break;
                   case "5" ://
                       elementValidationStatusChanged();
                   break;
                   case "0" :
                       elementValueChanged();
                       elementFocusChanged();
                       elementVisibleChanged();
                       lementNavigationChanged();
                       elementValidationStatusChanged();
                   break;
                   default :
                       console.log("HelperBridgeEvents: skiping helpper event listener trigger");
                   break;   
               }
         
       }
   
   
       /*** functions helpers ***/
   
   
       function elementValueChanged() {
           guideBridge.on("elementValueChanged" , function(e, payload) {
        var component = payload.target; // Field whose value has changed
        try {
            if(component.jsonModel.oldClause != undefined) {
                component.jsonModel.displayPictureClause = component.jsonModel.oldClause;
            }
            if(component.jsonModel.displayPictureClause.search("currency") != -1) {
            component.jsonModel.oldClause = component.jsonModel.displayPictureClause;
            guidelib.i18n.numberSymbols.grouping = "'";
            component.jsonModel.displayPictureClause = component.jsonModel.displayPictureClause.replace("currency","num").replaceAll("'",",");
        }
        } catch(e) {
           guidelib.i18n.numberSymbols.grouping = ",";
           console.log("skiping displayPictureClause");
        }
    
        console.log("Value of component " + component.name + " was " + payload.oldText);
        console.log("Value of component " + component.name + " is " + payload.newText);
           });
           console.log("Listener: elementValueChanged active");
       } 
   
   
   function elementVisibleChanged(){
       guideBridge.on("elementVisibleChanged" , function(event, payload) {
        var component = payload.target; // scripting model of the component whose visibility has changed
        var newValue = payload.newText;
        if (newValue) {
            console.log(component.name + " is visible now");
        } else {
            console.log(component.name + " is hidden now");
        }
       });
       console.log("Listener: elementVisibleChanged active");
     
   }
   
   
   function elementFocusChanged() {
       guideBridge.on("elementFocusChanged" , function(event, payload) {
         var component = payload.target;
         console.log("old elements's SOM Expression: " + payload.oldText);
          console.log("new elements's SOM Expression: " + payload.newText);
       });
       console.log("Listener : elementFocusChanged active")
   }
   
   function elementNavigationChanged() {
           guideBridge.on("elementNavigationChanged" , function(event, payload) {
            var component = payload.target;
            console.log("old panel's SOM Expression: " + payload.oldText);
            console.log("new panel's SOM Expression: " + payload.newText);
            });
            console.log("Listener : elementNavigationChanged active");
   }
   
   
   function elementValidationStatusChanged() {
           guideBridge.on("elementValidationStatusChanged" , function(event, payload) {
            var component = payload.target;
            try {
                if(component.jsonModel.displayPictureClause.search("currency") != -1) {
                guidelib.i18n.numberSymbols.grouping = "'";
                component.jsonModel.displayPictureClause = component.jsonModel.displayPictureClause.replace("currency","num").replaceAll("'",",");
                   component._triggerDisplayFormatChange(component.value);
                }
            } catch(e) {
                console.log("skiping displayPictureClause in validation status");
            }
            if (payload.prevText) {
                console.log("component became invalid" );
            } else {
               console.log("component became valid" );
            }
       });
        console.log("Listener : elementValidationStatusChanged active");
   }
   
   })();
   
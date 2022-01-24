(function(){


var display, timerControl, retryAttemps, formArea, initActive, initInactive, time;

const inactiveUser = function(){
 
   console.log('userInactive');
}

const activeUser = function(){

   console.log('user Active');
}



$(document).ready(function(e){
   time = 3; // 2 seconds
   formArea = document.forms;

    //  /* visual clock helper, uncoment to inactive
       var $cotainer = $('<div>'+ "Redirection in= " + '<span id="time">' + '</span>'+ '</div>');
       document.body.append($cotainer[0]); 
       display = document.querySelector('#time');

   //   */
   eventsObserver();
   controlClock();

});


function eventsObserver(){
    console.log('events observer');

     $(formArea).delegate('*', 'click', function(e){
   
      var $el = e.currentTarget.nodeName;
         if($el === 'SELECT' || $el ==='INPUT' || $el === 'BUTTON'){
              clearTimeout(initActive);
              console.log('extending SessionTimeout: ',$el, " ", time); 
              initActiveTimeout(inactiveUser, time);
          }
   });

   initActiveTimeout(inactiveUser, time);

}



function initActiveTimeout(callback,time){
    initActive = setTimeout(callback, time * 1000);
}

function initSessionTimeout(callback,time){
    console.log(time);
    initInactive = setTimeout(callback, time * 1000);
}


var ajax_extendSession = function(){
    $.ajax({
        url:handleUrl(),
        method:'GET',
        xhrFields: {
                   withCredentials: true
                           }
    }).done(function(data){
        // extend sesssion time

    }).fail(function(){
        // retry 
            console.log('error on first GET');
        if(retryAttemps > 3){
            console.log('Request Stopped');
        }else{
         // recall
            retryAttemps++;


        }
    });
}

// clock to visual control
function controlClock(){
    var start = Date.now(),
    diff, minutes, seconds;

    function timer(){
        diff = (((Date.now() - start) / 1000) | 0);
        minutes = (diff / 60 | 0);
        seconds = (diff % 60 | 0);
        if(display != undefined){
             display.textContent = minutes + ":" + seconds; 
        }

        if(diff % 5 === 0 && diff !=0){
           // here i try to call the server
           console.log("try to call the server");
        }
       
//         if(diff <=0){
//             start = Date.now() + 1000;
//         }
    };

    timer();
     timerControl = setInterval(timer,1000);

}

}());


/*
  Dropdownlist-ajila-events-logger
  ajila-event-logger tool to supervise events over library Select2
  on component Dropdownlist Accesibility feature development
*/

debbuger();


function debbuger() {

  if ($('.select2-hidden-accessible').length != 0) {

    if ($('.ajila-events-log').length === 0) {
      var setView = document.createElement("div");
      setView.className = "ajila-dropdownlist-events-logger";
      setView.innerText = "Logger: ";
      document.body.appendChild(setView);

      var setElementTarget = document.createElement("div");
      setElementTarget.className = "ajila-events-log";
      document.body.appendChild(setElementTarget);

      var stylingTitle =
        "background:#323232;color:#f5edda;text-align:center;width:10%;margin-left:21px;";
      var stylingArea =
        "background:#323232;color:#ffb606;padding-left:50px;padding-right:50px";

      $('.ajila-events-log').attr("style", stylingArea);
      $('.ajila-dropdownlist-events-logger').attr("style", stylingTitle);

      var $eventLog = $(".ajila-events-log");
      var $eventSelect = $(".select2-hidden-accessible");

      $eventSelect.select2();

      $eventSelect.on("select2:open", function (e) {
        log("Dropdownlist:open", e);
      });
      $eventSelect.on("select2:close", function (e) {
        log("Dropdownlist:close", e);
      });
      $eventSelect.on("select2:select", function (e) {
        log("Dropdownlist:select", e);
      });
      $eventSelect.on("select2:unselect", function (e) {
        log("Dropdownlist:unselect", e);
      });
      $eventSelect.on("change", function (e) {
        log("change", e);
      });

      function log(name, evt) {
        if (!evt) {
          var args = "{}";
        } else {
          var args = JSON.stringify(evt.params, function (key, value) {
            if (value && value.nodeName) return "[DOM node]";
            if (value instanceof $.Event) return "[$.Event]";
            return value;
          });
        }
        //var keyPres = evt.keyCode;
        var $e = $("<li>" + name + " -> " + args + "</li>");
        $eventLog.append($e);
        $e.animate({
          opacity: 1
        }, 10000, 'linear', function () {
          $e.animate({
            opacity: 0
          }, 2000, 'linear', function () {
            $e.remove();
          });
        });
      }

    } else {
      console.warn('Deleting existing debbuger tags');
      $('.ajila-dropdownlist-events-logger').remove();
      $('.ajila-events-log').remove();
      debbuger();
    }

  } else {
    console.log('no select2 dropdownlist detected');
  }
}
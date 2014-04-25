setSize = function() {
  if($("body").width() < 750) {
    $("body").addClass("mobile");
    var fontSize = $("body").width() / 30;
    if(fontSize > 14) {
      $(".nav li").css("font-size", fontSize + "px");
    }
  }
  else {
    $("body").removeClass("mobile");
  }
}
$(document).ready(setSize);
$(window).resize(setSize);

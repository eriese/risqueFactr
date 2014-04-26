setSize = function() {
  console.log($(window).width());
  if($(window).width() < 750) {
    $("body").addClass("mobile");
    var fontSize;
    if($(window).width() / 30 > 14) {
      fontSize = $(window).width() / 30;
    }
    else {
      fontSize = 14;
    }
    var marginWidth = $(window).width() / 50;
    console.log(fontSize);
    $(".nav li").css("font-size", fontSize + "px");
    $(".nav li").css("margin-right", marginWidth + "px");
  }
  else {
    $("body").removeClass("mobile");
  }
}
$(document).ready(setSize);
$(window).resize(setSize);

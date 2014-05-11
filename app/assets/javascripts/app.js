setSize = function() {
  if($(window).width() < 1000) {
    var fontSize;
    if($(window).width() / 50 > 16) {
      fontSize = $(window).width() / 30;
    }
    else {
      fontSize = 16;
    }
    var marginWidth = $(window).width() / 30;
    $(".nav li").css("font-size", fontSize);
    $(".nav li").css("margin-right", marginWidth);
  }
  else {
    // $("body").removeClass("mobile");
    // $(".to-hide").addClass("hidden");
  }
}
$(document).ready(setSize);
$(window).resize(setSize);

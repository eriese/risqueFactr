setSize = function() {
  if($("body").width() < 750) {
    $("body").addClass("mobile");
  }
  else {
    $("body").removeClass("mobile");
  }
}
$(window).resize(setSize);

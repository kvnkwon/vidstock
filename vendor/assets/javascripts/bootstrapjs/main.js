//Scroll Animation for About
$(function() {
    //caches a jQuery object containing the header element
    var animate = $("#progress");
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll >= 500) {
            animate.removeClass('display-none').addClass("display");
        } 
    });
});

$(function(){
  for (var i=0; i<2000; i++) {
    $("#diagonal").append("<div></div>")
  }
})
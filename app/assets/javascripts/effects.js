$(document).ready(function () {
  //your code here
});

$(window).on("load",function() {
  $(window).scroll(function() {
    var windowBottom = $(this).scrollTop() + $(this).innerHeight();
    $(".fade").each(function() {
      /* Check the location of each desired element */
      var objectBottom = $(this).offset().top + $(this).outerHeight();
      
      /* If the element is completely within bounds of the window, fade it in */
      if (objectBottom < windowBottom) { //object comes into view (scrolling down)
        if ($(this).css("opacity")==0) {$(this).fadeTo(500,1);}//$(".img-home-fixed").show( "drop", {direction: "down"}, 1000 );}
      } else { //object goes out of view (scrolling up)
        if ($(this).css("opacity")==1) {$(this).fadeTo(500,0);}//$(".img-home-fixed").hide( "drop", {direction: "up"}, 1000 );}
      }
    });
  }).scroll(); //invoke scroll-handler on page-load
});
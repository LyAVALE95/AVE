$( document ).ready(function() {
	$('.button-collapse').sideNav({
       menuWidth: 300, // Default is 300
       edge: 'right', // Choose the horizontal origin
       closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
       draggable: true, // Choose whether you can drag to open on touch screens,
       onOpen: function(el) { /* Do Stuff*/ },  // A function to be called when sideNav is opened
       onClose: function(el) { /* Do Stuff*/ }, // A function to be called when sideNav is closed
    });
    $('.carousel.carousel-slider').carousel({fullWidth: true});
  });

function showmenu(){
  //alert("Querollo");
  $("#submenu").css("display", "block");
  //$("#submenu").css("margin-bottom", "-205px");
}
function hidemenu(){
  //alert("Querollo");
  $("#submenu").css("display", "none");
  //$("#submenu").css("margin-bottom", "205px");
}
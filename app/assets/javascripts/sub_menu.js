$("#submenu_link").on("click", function(){
	alert("Ouch");
});

function goandrefresh(){
	 setInterval(function() {
    cache_clear()
  }, 500);
}
function cache_clear() {
  window.location.reload(true);
  // window.location.reload(); use this if you do not remove cache
}
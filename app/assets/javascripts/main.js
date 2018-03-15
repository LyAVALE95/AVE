$( document ).ready(function() {
     $( "#mainsearch" )
       .on( "click", function() {
         $( "#search-icon" ).css({ 'color': 'white' });
       })
       .mouseleave(function() {
           $( "#search-icon" ).css({ 'color': 'white' });
       });

});


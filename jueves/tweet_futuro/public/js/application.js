$(document).ready(function() {
  $( "#tweetForm" ).on( "submit", function( event ) {
    event.preventDefault();
    $( '#statusMessage' ).html( "Tweeteando" );
    var formData = $( this ).serialize();
    $.post( "/tweet", formData, function( data ) {
      $('#tweetField').prop('disabled', true);
    }).done(function(data) {
      $('#tweetField').prop('disabled', false);
      setInterval(function(){ 
        $.get( "/status/" + data, function( data ) {
          $( '#statusMessage' ).html( data );
        });
      }, 30);
    });
  });
});
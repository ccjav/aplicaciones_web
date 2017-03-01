$(document).ready(function() {
  $( "#tweetForm" ).on( "submit", function( event ) {
    event.preventDefault();
    $( '#statusMessage' ).html("Procesando...");
    var formData = $( this ).serialize();
    $.post( "/tweet", formData, function( data ) {
      $('#tweetField').prop('disabled', true);
    }).done(function(data) {
      $('#tweetField').prop('disabled', false);
      $( '#statusMessage' ).html( data );
    });
  });
});

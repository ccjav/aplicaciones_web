$(function(){
  $( '#style_editor' ).on('submit', function( event ) {
    event.preventDefault();
    styler();
  })
});

function styler () {
  var selector = $( "input[name='selector']" ).val();
  var property = $( "input[name='property']" ).val();
  var value    = $( "input[name='value']" ).val();
  $(selector).css(property, value);
}
$(function() {
  $('#next_frame').click(function(){
    $('.frames').animate({
      left: '-=100%'
    }, 300, function() {
      $( ".frames li:first-child" ).appendTo($('.frames'));
      $( ".frames" ).css("left", "0");
    });
  });

  $('#previous_frame').click(function() {
    $( ".frames li:last-child" ).prependTo('.frames');
    $( ".frames" ).css("left", "-100%");
    $('.frames').animate({
      left: '+=100%'
    }, 300);
  });
});

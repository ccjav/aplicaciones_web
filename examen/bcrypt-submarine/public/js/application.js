//función que inicia el juego
function start_game(subOne, subTwo) {

  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();
  console.log("winner " + winner);
    $('.cell').on("click", function(evento){
      var playerClick = $(this).attr('id');
      var url = $('#play').attr('action');
      //¿qué debería ir aquí para conocer el número de submarinos destruidos o si el jugador es ganador?


      //¿que debería ir aquí para mandar al controlador el conteo de submarinos destruidos y el
      //conteo de oportunidades por ronda?

      var thescore = won(playerClick, winner);
      console.log("thescore " + thescore);
      if (thescore != undefined) {

        $.post( "/games", "score=" + thescore.toString(), function( data ) {
          // $('#tweetField').prop('disabled', true);
          console.log("data " + data)
        });
      }
      countForPlay += 1;

    });

  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    console.log("en won " + playerValue + " " + subValue);
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //variable que lleva el conteo de submarinos destruidos
        nowWinner += 1;
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    //¿que debería ir aquí para conocer el número de submarinos destruidos y conocer ganador?
    // console.log("subs destroyed " + nowWinner + " y tries " + countForPlay);
    score(nowWinner);
    if (countForPlay == 2) {
      return nowWinner
    }

  }
}

//función que muestra el score del jugador
function score(value) {
  console.log("en score " + value)
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  //¿qué debería ir aquí para generar las celdas cada vez que se inicia juego?
  for (var a = 0; a < 9; a += 1) {
    $( "#container" ).append( "<div id='c" + a + "' class='cell'></div>" );
  }
}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = 0;
  var subTwo = 0;
  //¿qué debería ir aquí para generar las dos posiciones de los submarinos?
  subOne = Math.floor((Math.random() * 8) + 0);
  subTwo = Math.floor((Math.random() * 8) + 0);

  if (subOne == subTwo) {
    randomCell();
  } else {
    var valueSubOne = "c" + subOne;
    var valueSubTwo = "c" + subTwo;

    return [valueSubOne, valueSubTwo]
  }

}

$(document).ready(function(){
  	$('#play').on("submit", function(evento){
  	  evento.preventDefault();
      var url = $('#play').attr('action');
      $('#win').text(" ");
      //variable que lleva el conteo de oportunidades por ronda
      countForPlay = 0;
      //variable que lleva el conteo de submarinos destruidos
      nowWinner = 0;
      //variable que termina el juego 'alert game over'
      status = false;
      //¿que debería ir aquí para comenzar el juego?
      resetInit();
      // console.log(randomCell());
      start_game(2, 3);
    });

});
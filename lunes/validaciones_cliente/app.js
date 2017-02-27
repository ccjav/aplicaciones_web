$(document).ready(function() {
  $( "#signUpForm" ).on( "submit", function( event ) {
    event.preventDefault();
    validate();
  });
});

function validate () {
  $( "#errors" ).html( "" );   
  var email = $("#email").val();
  var password = $("#password").val();
  emailValidation(email);
  passwordValidation(password);
}

function emailValidation (email) {
  // la i es para que se case insensitive
  var regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i;
  var string = email;
  var valid = regex.test(string);
  if (!valid) {
    $("#errors").append("<p>Correo incorrecto.</p>");
  }
}

function passwordValidation (password) {
  var string = password;
  var onenumber = /.*[0-9].*/
  var onenumbervalid = onenumber.test(string);
  if (!onenumbervalid) {
    $("#errors").append("<p>La password requiere al menos un numero.</p>");
  }
  var onecapital = /(?=.*[A-Z])/ // Positive lookahead.
  var onecapitalvalid = onecapital.test(string);
  if (!onecapitalvalid) {
    $("#errors").append("<p>La password requiere al menos una letra capitalizada.</p>");
  }
  var eightchars = /^.{8,}$/
  var eightcharsvalid = eightchars.test(string);
  if (!eightcharsvalid) {
    $("#errors").append("<p>La password requiere al menos ocho caracteres.</p>");
  }
}


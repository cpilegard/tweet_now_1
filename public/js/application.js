$(document).ready(function() {

  if ( $("#username").length > 0 ) { 
    var username = $('#username').text();
    console.log(username);
    $.ajax({
    url: "/" + username,
    type: "post"
    }).done(function(result) {
      for (i=0; i < result.length; i++) {
        $('.container').append('<p>'+ result[i] +'</p>')
      }
      $('#loading').hide();
    });
  }
});

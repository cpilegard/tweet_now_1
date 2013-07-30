$(document).ready(function() {
  $('form').on('submit', function(e) {
    e.preventDefault();
    $('form').hide();
    $('.container').append("<p id='status'>tweeting......</p>");
    $.ajax({
      url: '/tweet',
      type: 'post',
      data: { content: $('#content').val() }
    }).done(function(result) {
      $('#status').hide();
      $('.container').append('success');
    }).fail(function(result) {
      $('#status').hide();
      $('.container').append('failed');
    });
  });
});


var handler = function(event){
  $('#poster_event_id').bind('change', function(event){
  	var option = $(event.target).find(':selected').attr('event_time');
  	console.log(option);
    $('#poster_event_time').val(option);
  });
};

$(document).ready(handler)
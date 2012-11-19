
var datetimeselect = function(){
$('#poster_event_time').datetimepicker({
	dateFormat: "dd.mm.yy"
});
};


var handler = function(event){
  $('#poster_event_id').bind('change', function(event){
  	var option = $(event.target).find(':selected').attr('event_time');
    $('#poster_event_time').val(option);
  });
};

$(document).ready(datetimeselect)
$(document).ready(handler)
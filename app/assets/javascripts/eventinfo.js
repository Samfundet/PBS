
var datetimeselect = function(){
$('#poster_event_time').datetimepicker({
	dateFormat: "dd.mm.yy"
});
};

var formatDate = function(){
	if (window.location.pathname.slice(-4,-1) == "edi" && $('#poster_event_time').val().length != 0) {
	  month = $('#poster_event_time').val().slice(5,7);
	  day = $('#poster_event_time').val().slice(8,10);
	  minAndHour = $('#poster_event_time').val().slice(11,16);
	  year = $('#poster_event_time').val().slice(0,4);
	  completeDate = (day + "." + month + "." + year + " " + minAndHour);
	  $('#poster_event_time').val(completeDate);
	}
}

var handler = function(event){
  $('#poster_event_id').bind('change', function(event){
  	var option = $(event.target).find(':selected').attr('event_time');
    $('#poster_event_time').val(option);
  });
};

$(document).ready(datetimeselect)
$(document).ready(handler)
$(document).ready(formatDate)
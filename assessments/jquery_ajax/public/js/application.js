function changeCellColor(serverResponse) {
	var data = $.parseJSON(serverResponse)
	$('#color_me').children('li').eq(data.cell-1).css('background',data.color);
}

$(document).ready(function(){
	$('#get_color').click(function(evt) {
		var input = $(this).serialize()
		evt.preventDefault()
		evt.preventDefault();
		$.post('/color', input, changeCellColor);
	});
});

function doWhenServerReturns(serverResponse) {
	$('#grandma-says').html(serverResponse);
	$('form > input[name="user_input"]').val("").focus();
}

$(document).ready(function() {
	$('form').submit(function(evt) {
		var input = $(this).serialize()
		evt.preventDefault()
		$.post('/grandma', input).done(doWhenServerReturns);
		// same as $.post('/grandma', input, doWhenServerReturns);
	});
});

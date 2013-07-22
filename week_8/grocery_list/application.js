/* 
 * What are the objects in this exercise?
 * What are their properties and methods?
 * How do your objects interact with their respective DOM elements?
 */
//this will hold reference to the tr we have dragged and its helper

$(document).ready ( function() {
	$('#store_list .item').draggable({
		helper: 'clone',
		appendTo: 'body'
	});

	$('#grocery_list').droppable({ 
		accept: '.item',
		drop: function(event, ui) { 
			var element = ui.draggable.clone();
			element.removeClass('item');
			$(this).append(element);
			reCalculateTotal();
		}  
	});

	$('#grocery_list tbody').sortable();

	function reCalculateTotal() {
		var total = 0;
		$('#grocery_list tbody tr').each( function() {
			total += parseFloat($(this).find('td.item_price').text());
		})
		$('#total_cost').text(total)
	}
});
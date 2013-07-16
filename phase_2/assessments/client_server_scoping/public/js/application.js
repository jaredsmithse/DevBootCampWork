$(document).ready(function() {
  $('.awesomeness_teller').on('click', function() {
  	$('h2').html($(this).attr('data-heading'));
  });

  $('.skill_teller').on('click', function() {
  	$('h2').html(window.location.pathname.slice(8));
  });

  $('.meal_teller').on('click', function() {
  	$('h2').html(meals[Math.floor(Math.random()*meals.length)]);
  });



  
});

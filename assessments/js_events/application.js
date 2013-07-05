$(document).ready(function() {
  var todoTemplate = $.trim($('#todo_template').html());

  function bindEvents() {
    $('.add').click(buildTodo);

    $("body").on('click','a.delete', function (e) {
      e.preventDefault();
      $(this).parents()[2].remove();
    });

    $("body").on('click','a.complete', function (e) {
      e.preventDefault();
      var h2 = $(this).parents().eq(2).find('h2')
      h2.html(h2.text() + " [complete]")
    });
  }

  function buildTodo(event) {
    // Creates an jQueryDOMElement from the todoTemplate.
    var $todo = $(todoTemplate);
    // Modifies it's text to use the passed in todoName.
    $todo.find('h2').text($('.todo').val());
    // Returns the jQueryDOMElement to be used elsewhere.
    addTodo($todo);
  }
  
  function addTodo(todo) {
    $('body').append(todo);
  }

  bindEvents();
});

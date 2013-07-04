$(document).ready(function() {
  var todoTemplate = $.trim($('#todo_template').html());

  function bindEvents() {
    $('.add').click(buildTodo);

    $("#todo_template").on('click','a.delete', function () {
      $('.complete').click(completeTodo);
      $('.delete').click(deleteTodo);
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

  function completeTodo(event) {
    debugger
  }

  function deleteTodo(event) {
    debugger
  }

  bindEvents();
});

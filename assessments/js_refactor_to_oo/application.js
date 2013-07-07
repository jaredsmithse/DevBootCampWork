$(document).ready(function() {
  dice = new Dice();
  $('#roller button.add').on('click', dice.add);
  $('#roller button.roll').on('click', dice.rollAll);
});

function Dice() {
}

Dice.dice = []

function Die() {
  this.$el = $('<div class="die">0</div>');
}

Dice.prototype.rollAll = function() {
  for (var i = 0; i < Dice.dice.length; i++) {
    Dice.dice[i].roll();
  }
}

Dice.prototype.add = function() {
  die = new Die();
  Dice.dice.push(die);
  $('.dice').append(die.$el);
}

Die.prototype.roll = function() {
  var value = Math.floor((Math.random()*6)+1);
  this.$el.text(value);
}



module PrintDialogue

  def game_start
    puts "Welcome to Flash Cards with Friends!"
    puts "Type 'exit' if you feel you're in over your head."
    print "Type 'answer' if you know you will never get it.\n\n"  
  end

  def correct_answer
    print "Correct! You're not as dumb as you look...\n\n"
  end

  def wrong_answer
    puts "Wow, how do you not know this?"
    puts "I'll let you try again because I feel bad for you..."
  end

  def naughty_words
    puts "Don't be mean, I don't like you either."
    print "Everything is logged and posted to Socrates. I win.\n\n"
  end

  def gave_up
    puts "You should just give up on life, but here is your answer."
  end

  def print_hint(hint)
    puts "The first letter is...#{hint}"
  end
end

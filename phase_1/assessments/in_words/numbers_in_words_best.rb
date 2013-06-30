BIG_NUMBER_MODIFIERS = {
  1_000_000_000_000 => 'trillion',
  1_000_000_000 => 'billion',
  1_000_000 => 'million',
  1_000 => 'thousand',
  100 => 'hundred'
}

NUM_WORDS = {
  90 => 'ninety',
  80 => 'eighty',
  70 => 'seventy',
  60 => 'sixty',
  50 => 'fifty',
  40 => 'fourty',
  30 => 'thirty',
  20 => 'twenty',
  19 => 'nineteen',
  18 => 'eighteen',
  17 => 'seventeen',
  16 => 'sixteen',
  15 => 'fifteen',
  14 => 'fourteen',
  13 => 'thirteen',
  12 => 'twelve',
  11 => 'eleven',
  10 => 'ten',
  9 => 'nine',
  8 => 'eight',
  7 => 'seven',
  6 => 'six',
  5 => 'five',
  4 => 'four',
  3 => 'three',
  2 => 'two',
  1 => 'one'
}

def in_words(int, num_word = '')
  if int > 100
    BIG_NUMBER_MODIFIERS.each do |number, word|
      if int/number >= 1
        num_word += in_words(int/number) + word + ' '
        int %= number
      end
    end
  end

  NUM_WORDS.each do |number, word|
    num_word += (word + ' ') * (int/number) 
    int %= number
  end
  num_word
end

puts in_words(11_944_456) == "eleven million nine hundred fourty four thousand four hundred fifty six "
puts in_words(378) == "three hundred seventy eight "
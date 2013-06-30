BIG_NUMBER_MODIFIERS = {
  1_000_000_000_000 => 'trillion',
  1_000_000_000 => 'billion',
  1_000_000 => 'million',
  1_000 => 'thousand',
  100 => 'hundred'
}

MODIFIERS = ['hundred', 'thousand', 'million', 'billion', 'trillion']

NUM_WORDS = {
  900 => 'nine hundred', 
  800 => 'eight hundred',
  700 => 'seven hundred',
  600 => 'six hundred',
  500 => 'five hundred',
  400 => 'four hundred',
  300 => 'three hundred',
  200 => 'two hundred',
  100 => 'one hundred',
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

def in_words(int, depth = 1, num_word = '')
  return "" if int == 0
  if int < 1000
    NUM_WORDS.each do |number, word|
      num_word += (word + ' ') * (int/number) 
      int %= number
    end
    #return num_word
  else
    num_word += in_words(int.to_s[0..-4].to_i, depth + 1) + MODIFIERS[depth] + ' ' + in_words(int.to_s[-3..-1].to_i,depth + 1)
  end
  num_word
end

puts in_words(11_944_456) == "eleven million nine hundred fourty four thousand four hundred fifty six "
puts in_words(378) == "three hundred seventy eight "


MODIFIERS = ['trillion', 'billion', 'million', 'thousand', 'hundred']

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


def in_words(int)
  num_word = ''
  ints = int.to_s.split('').reverse.each_slice(3).to_a.reverse.map {|x| x.reverse.join('').to_i}
  index = MODIFIERS.size - ints.size
  for num_block in ints
    num_word += solve_number_block( num_block ) + MODIFIERS[index] + ' '
    index += 1
  end
  num_word[0..-10]
end

def solve_number_block(int)
  num_word = ''
  return num_word if int.zero?
  NUM_WORDS.each do |number, word|
    num_word += (word + ' ') * (int/number) 
    int %= number
  end
  num_word
end


puts in_words(11_944_456) == "eleven million nine hundred fourty four thousand four hundred fifty six"
puts in_words(378) == "three hundred seventy eight"


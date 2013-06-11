# no original gist

def convert_word(string)

  vowels = ['a','e','i','o','u','y']

  return string if vowels.include? string[0]

  string.each_char do |char|
    if vowels.include? char
      return char + string.split(char).last + string.split(char).first + 'ay'
    end
  end

end

def convert_sentence
  sentence = gets.chomp

  sentence = sentence.split(' ').map {|word| convert_word(word)}
  sentence[0] = sentence[0].downcase.capitalize
  sentence[-1] = sentence[-1].sub('.','') + '.'
  sentence.join(' ')

end

puts convert_sentence

# original gist : https://gist.github.com/249d440b28c4b732fe3a

def to_roman(num)
  roman_numeral = ""
  arabic_to_roman_mapping = {
    1000  =>    'M',
    900   =>    'CM',
    500   =>   'D',
    400   =>   'CD',
    100   =>    'C',
    90    =>   'XC',
    50    =>   'L',
    40    =>   'XL',
    10    =>   'X',
    9     =>   'IX',
    5     =>   'V',     
    4     =>   'IV',
    1     =>   'I'}

    arabic_to_roman_mapping.each do |number, letter|
      roman_numeral += letter * (num/number) 
      num = num % number
    end
  
    roman_numeral
end

# Drive code... this should print out trues.

puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

# TODO: what other cases could you add to ensure your to_roman method is working?
def is_anagram? (str1, str2)
  return false if str1.length != str2.length
 	str1.downcase.split('').sort == str2.downcase.split('').sort
end
# this is already canonical
 
def anagrams_for(original, dictionary)
  dictionary.select { |word| is_anagram?(original, word)}
end
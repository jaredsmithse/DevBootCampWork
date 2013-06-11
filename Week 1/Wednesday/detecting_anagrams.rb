# no original gist

def is_anagram? (str1, str2)
  return false if str1.length != str2.length
  str1.downcase.split('').sort == str2.downcase.split('').sort
end
# this is already canonical

puts is_anagram?("iceman","cinema")

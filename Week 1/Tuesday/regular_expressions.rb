# original gist : https://gist.github.com/dbc-challenges/029b77dac68fc635e5e8

# Determine whether a string contains a Social Security number.
def has_ssn?(string)
  string.match(/\d{3}[-]\d{2}[-]\d{4}/).nil? ? false : true
end

puts "has_ssn? returns true if it has what looks like a SSN"
puts has_ssn?("please don't share this: 234-60-1422") == true

puts "has_ssn? returns false if it doesn't have a SSN"
puts has_ssn?("please confirm your identity: XXX-XX-1422") == false


# Return the Social Security number from a string.
def grab_ssn(string)
  has_ssn?(string) ? string.match(/\d{3}[-]\d{2}[-]\d{4}/).to_s : nil
end


puts "grab_ssn returns an SSN if the string has an SSN"
puts grab_ssn("please don't share this: 234-60-1422") == "234-60-1422"

puts "grab_ssn returns nil if it doesn't have a SSN"
puts grab_ssn("please confirm your identity: XXX-XX-1422") == nil


# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
  string.split(" ").collect { |word| grab_ssn(word)}.compact
end

puts "grab_all_ssns returns all SSNs if the string has any SSNs"
puts grab_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == ["234-60-1422", "350-80-0744", "013-60-8762"]

puts "grab_all_ssns returns an empty Array if it doesn't have any SSNs"
puts grab_all_ssns("please confirm your identity: XXX-XX-1422") == []


# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.split(" ").map { |word| has_ssn?(word) ? word.gsub( /\d{3}[-]\d{2}[-]/, "XXX-XX-") : word }.join(" ")
end

puts "hide_all_ssns obfuscates any SSNs in the string"
puts hide_all_ssns("234-60-1422, 350-80-0744, 013-60-8762") == "XXX-XX-1422, XXX-XX-0744, XXX-XX-8762"

puts "hide_all_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: XXX-XX-1422"
puts hide_all_ssns(string) == string


# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
  string = string.split(" ")
  string.map do |word|
    word.gsub!('.','-') unless word.match(/\d{3}[.]\d{2}[.]\d{4}/).nil?
    unless word.match(/\d{9}/).nil?
      word.insert(5,'-')
      word.insert(3, '-')
    end
  end
  string.join(' ')

end

puts "format_ssns finds and reformat any SSNs in the string"
puts format_ssns("234601422, 350.80.0744, 013-60-8762") == "234-60-1422, 350-80-0744, 013-60-8762"

puts "format_ssns does not alter a string without SSNs in it"
string = "please confirm your identity: 44211422"
puts format_ssns(string) == string
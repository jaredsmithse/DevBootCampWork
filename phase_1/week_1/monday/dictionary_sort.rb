# original gist : https://gist.github.com/f41a78415ae497999b95

def dictionary_sort(arr)
  puts "Congratulations! Your Dictionary has #{arr.size} words"
  puts arr.sort_by {|x| x.downcase}
end
 
dictionary=[] 
puts "Type a word:"
input = gets.chomp
 
 
while input != ""
  dictionary << input
  puts "Type another word (or press enter to finish):"
  input = gets.chomp
end
 
dictionary_sort(dictionary)
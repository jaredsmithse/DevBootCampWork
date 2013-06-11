# original gist : https://gist.github.com/628a442f4c82ea816ef8

def count_words(file_path, top_n_words = 3)
	word_tally = {}
	word_tally.default = 0

	stop_words = []
	stop_words_file = File.new("stop_words.txt","r")
	stop_words_file.each {|word| stop_words << word.chomp}
	
	file = File.new(file_path, "r")
	
	document = file.each_line do |line|
		line.split(' ').each do |word|
			word = word.gsub(/\W/,"").downcase.chomp
			next if stop_words.include? word
			next if word.empty?
			word_tally[word] += 1
		end
	end

	word_tally = Hash[word_tally.sort_by {|_key, value| value}]
	word_tally.keys.to_a.reverse.each_with_index do |word, count| 
		break if count >= top_n_words
		puts "'#{word}': #{word_tally[word]} occurrences"
	end
end
file = "test.txt"
count_words(file , 10)


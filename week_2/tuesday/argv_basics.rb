# no original gist


def pig_latin(word) # delet
  vowels = /[aeiou]/
 
  letters = word.split(//)
  if letters.first =~ vowels
    word
  else
    letters.each do
      letters << letters.shift unless letters.first =~ vowels
    end
  end
  letters.join + "ay"
end
 

def evaluate str
    math = str.split
    op = []
    answer = []

    math.each do |x|
        if x=~ /\d/
            answer.push x.to_i
        else
            op = answer.pop 2
            answer.push(op[0].send(x, op[1]))
        end
    end
    answer.map { |x| x.to_i }.join.to_i
  end

ARGV.each { |word| print pig_latin(word) + " " }
puts


# original gist : https://gist.github.com/09f5455a09bdee5d01a5

def deaf_grandma
  reply = gets.chomp
  while true
    if reply == "I love ya, Grandma, but I've got to go."
      reply = gets.chomp
      if reply.empty?
        reply = gets.chomp
        if reply.empty?
          break
        end
      end
    end
    if reply == reply.upcase
      puts "NO, NOT SINCE 1983!"
    else
      puts "HUH?! SPEAK UP, SONNY!"
    end
  reply = gets.chomp
    
  end
end
 
deaf_grandma
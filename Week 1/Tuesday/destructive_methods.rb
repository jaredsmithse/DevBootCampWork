# original gist : https://gist.github.com/00c978ee83bc6178b1c1

def destroy_message(message)
	new_message = message
	new_message.include?(":") ? index = new_message.index(":") : index = -1
	new_message[0..index]
end

### version 1 ###
class String
	def destroy_message!
		self.include?(":") ? index = self.index(":") + 1 : index = -1
		self.sub!(self[index..-1],"")
	end
end

### version 2 ###
def destroy_message!(string)
	string.include?(":") ? index = string.index(":") + 1 : index = -1
	string.sub!(string[index..-1],"")
end


# Driver code... 
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
puts destroy_message(string) == "this message will self-destruct:"
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this has no message"
original_string = string.dup
puts destroy_message(string) == string
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
destroy_message!(string)
puts string == "this message will self-destruct:"
puts string != original_string

string = "this has no message"
result = destroy_message!(string)
puts result.nil? == false
puts string == string
# no original gist

class Queue
  def initialize
		@store = []
	end

	def queue(x)
		@store << x
	end

	def dequeue
		raise "List is empty" if self.empty?
		@store.delete_at(0)
	end

	def empty?
		@store.empty?
	end
end


#create a new queue 
my_queue = Queue.new;

#verify there are no elements on the new queue
puts "The queue is empty?  #{my_queue.empty?}"

#add 3 elements to the queue
my_queue.queue("I was first")
my_queue.queue("I was second")
my_queue.queue("The next one is last")

#since our queue is implemented on array we can add any type of object
my_queue.queue(15)


#look at all the elements in the queue by popping them off one at time 

puts "Next Element: #{my_queue.dequeue}"
puts "Next Element: #{my_queue.dequeue}"
puts "Next Element: #{my_queue.dequeue}"
puts "Next Element: #{my_queue.dequeue}"

#verify there are no elements left on the queue
puts "The queue is empty?  #{my_queue.empty?}"

#what happens if you try to call dequeue on an empty queue?
puts "Trying to remove an item from an empty queue ... "
puts "Next Element: #{my_queue.dequeue}"

#############################################################################################
######################################## 1. Describe ########################################
#############################################################################################
# A Priority Queue (PQ) acts a lot like a normal queue, but in a PQ each element has an 
# associated number which dictates its order. If two elements have the same priority, then the
# element that was added first is placed in front of the new element (in other words, they queue).

############################################################################################
####################################### 2. Implement #######################################
############################################################################################
class PriorityQueue

	def initialize
		@priority_queue = []
	end

	def queue(priority, element)
		if self.empty?
			@priority_queue << [priority, element]			
		else
			@priority_queue.each_with_index do |current_element, index|
				if current_element[0] < priority
					@priority_queue.insert(index, [priority, element])
					break
				elsif @priority_queue[index] == @priority_queue[-1]
					@priority_queue << [priority, element]
					break
				end
			end

		end
	end


	def dequeue
		raise "list is empty" if self.empty?
		@priority_queue.delete_at(0)
	end


	def empty?
		@priority_queue.empty?
	end

end

my_pq = PriorityQueue.new

my_pq.queue(4, "I should be second")
my_pq.queue(1, "I should be last")
my_pq.queue(4, "I should be third")
my_pq.queue(100, "I should be first")
my_pq.queue(2, "I should be fourth")

puts my_pq.dequeue
puts my_pq.dequeue
puts my_pq.dequeue
puts my_pq.dequeue
puts my_pq.dequeue

#############################################################################################
######################################## 3. Get real ########################################
#############################################################################################
# PQs are great for concurrency. If you have a component in your program that queues up tasks
# for processing because it gets requests faster than it can handle them, then a high priority
# task can 'jump ahead' in line when needed. I have used this concept in an actor based system 
# using the akka library (written in Scala) for Java and Scala.
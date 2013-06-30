# original gist : https://gist.github.com/aespaldi/5760029

class Vehicle

	def initialize(args)
		@color = args[:color]
		@wheels = args[:wheels]
	end

	def drive
		@status = :driving
	end

	def brake
		@status = :stopped
	end
end

class Car < Vehicle
	@@WHEELS = 4

	def initialize(args)
		super
		@wheels = @@WHEELS
	end

	def needs_gas?
		return [true,true,false].sample
	end
end


class Bus < Vehicle
	attr_reader :passengers

	def initialize(args)
		super
		@num_seats = args[:num_seats]
		@fare = args[:fare]
		@passengers=[]
	end
	
	def drive
		return self.brake if stop_requested?
		super
	end
	
	def admit_passenger(passenger,money)
		@passengers << passenger if money > @fare
	end
	
	def stop_requested?
		return [true,false].sample
	end
	
	def needs_gas?
		return [true,true,true,false].sample
	end
end


class Motorbike < Vehicle
	@@WHEELS = 2
	def initialize(args)
		super
	end

	def drive
		super
		@speed = :fast
	end

	def needs_gas?
		return [true,false,false,false].sample
	end

	def weave_through_traffic
		@status = :driving_like_a_crazy_person
	end
end

#######################
######## Tests ########
#######################

my_car = Car.new(:color => "black")
my_bike = Motorbike.new(:color => "red")
my_bus = Bus.new(:color => "yellow", :wheels => 6, :num_seats => 20, :fare => 2)


car_gas = my_car.needs_gas?
puts car_gas == true || car_gas == false
puts my_car.drive == :driving
puts my_car.brake == :stopped


bike_gas = my_bike.needs_gas?
puts bike_gas == true || bike_gas == false
puts my_bike.drive == :fast
puts my_bike.brake == :stopped
puts my_bike.weave_through_traffic == :driving_like_a_crazy_person


bus_gas = my_bus.needs_gas?
puts bus_gas == true || bus_gas == false
puts my_bus.drive == :driving || my_bus.drive == :stopped
puts my_bus.brake == :stopped
my_bus.admit_passenger("Lily",4)
puts my_bus.passengers == ["Lily"]













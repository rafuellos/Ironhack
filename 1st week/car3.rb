class Car
	attr_accessor :sound, :wheels
	
	def initialize sound, wheels
		@sound = sound
		@wheels = wheels
	end

end

class Bycicle
	attr_accessor :sound, :wheels
	
	def initialize sound, wheels
		@sound = sound
		@wheels = wheels
	end

end

class Truck
	attr_accessor :sound, :wheels
	
	def initialize sound, wheels
		@sound = sound
		@wheels = wheels
	end

end


class NoisePrinter
	
	def self.list_features array_of_vehicles
		all_sounds =  array_of_vehicles.reduce ("") {|total, vehicle| total + "......." +vehicle.sound}
		"All the vehicles singing together \n #{all_sounds}"
	end
end

class WheelCounter 

	def self.list_features array_of_vehicles
		total_wheels = array_of_vehicles.reduce (0) {|total, vehicle| total + vehicle.wheels}
		"We have to change a total of #{total_wheels}"
	end
end



car = Car.new "Brrrrrooooooommmm", 4
truck = Car.new "Puuuuuuuuuuuuu", 8
motorcycle = Car.new "Piiiiiiiiiiii", 2

array_of_vehicles = [car, truck, motorcycle]

puts WheelCounter.list_features array_of_vehicles
puts NoisePrinter.list_features array_of_vehicles
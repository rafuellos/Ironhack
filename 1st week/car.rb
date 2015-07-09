require 'pry'

class Car
	attr_accessor :sound
	def initialize sound
		@sound = sound
		@cities = []
	end


	def make_noise
		puts @sound
	end	

	def self.make_noise_twice (car)
		2.times {car.make_noise} 
	end

	def visited_city city
		@cities << city
	end

	def print_cities
		puts @cities
	end
end

class RacingCar < Car

	def initialize 
		super "BROOOM"
	end
	
end

quiet_car = Car.new("Brooom")
#quiet_car.make_noise

noisy_car = Car.new("BROOOOOOOOM")
tourism = Car.new("fiuuuuuuu")
#noisy_car.make_noise

#Car.make_noise_twice (quiet_car)

# quiet_car.visited_city "Madrid"
# quiet_car.visited_city "Valencia"
# quiet_car.visited_city "Barcelona"
# quiet_car.print_cities
#  #quiet_car.cities "Valencia"

f1 = RacingCar.new
# f1.make_noise
# f1.visited_city "Avila"
# f1.visited_city "Segovia"
# f1.print_cities


car_collection = []
# car_collection << noisy_car << quiet_car << f1
car_collection << tourism << quiet_car << noisy_car
# car_collection.each do |car|
# 	car.make_noise
# end

# sounds = ["Broom", "Meek", "Nyan"]
# new_car_sounds = sounds.map do |sound|
# 	Car.new(sound).makesound
# end

sounds = ["Broom", "Meek", "Nyan"]
new_car_sounds = sounds.map do |sound|
	Car.new(sound).sound
end

puts new_car_sounds.reduce("")  {|sounds , car| sounds + car}

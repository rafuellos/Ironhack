class Car

	def initialize sound, engine
		@sound = sound
		@engine = engine
		@car_sound = ""
	end

	def define_noise
		@car_sound = @engine.sound + " " + @sound
	end

end

class Engine

	attr_accessor :sound
	def initialize sound
		@sound = sound + "!!!....."
	end

end

class RaceEngine < Engine
	def initialize
		super "Brrrroooooooommmmomomomoom"
	end
end

class OldEngine < Engine
	def initialize
		@sound = "xxxxxxx"
	end
end

class SilentEngine < Engine
	def initialize
		sound = "..............."
		super sound
		
	end
	
end


new_car = Car.new "Fiuuuuu", OldEngine.new
new_car2 = Car.new "Fiuuuuu", RaceEngine.new 
new_car3 = Car.new "Fiuuuuu", Engine.new("cricri")
new_car4 = Car.new "Fiuuuuu", SilentEngine.new

puts new_car.define_noise
puts new_car2.define_noise
puts new_car3.define_noise
puts new_car4.define_noise

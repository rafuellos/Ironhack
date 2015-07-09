require 'pry'

class Room
	attr_accessor :id, :description, :directions, :connection
	def initialize(id,description,connection)
		@id = id
		@description = description
		@directions = {'N'=> connection[0], 'E'=>connection[1], 'S'=> connection[2], 'W'=> connection[3]}
		@connection = connection
	end

end

class Game
	#attr_accessor :mapa
	def initialize(initial_room)
		@mapa = []
		@current_location = initial_room
		@status = true
		@direction = ""
	end
	def include_rooms(rooms)
		rooms.each do |room| 
		@mapa << room 
		end
	end
	def get_mapa
		@mapa
	end
	def print_room
		puts @current_location.description
		print_exits
	end
	def print_exits
		connections =  @current_location.connection
		#binding.pry
		exits_locations = connections.find {|x| x == 0}
		binding.pry
		puts "Exits are in the #{exits_locations}"		
	end
	def get_direction
		puts "what direction do you want to go?"
		@direction = gets.chomp.upcase
	end
	def move_room
		next_room = @current_location.directions[@direction]
		if next_room
			update_location(next_room)
		else 
			puts "sorry, wrong direction"
		end
	end
	def update_location(new_id)
		if new_id == 0
		elsif new_id == "e"
			puts "You have found the exit"
			sleep 5
			@status = false
		else
			@current_location = @mapa.find {|room| new_id == room.id}
			#@current_location = location_array[0]			
		end
	end

	def run_game
		while @status do
			print_room
			get_direction
			move_room
		end
	end

end

room1 = Room.new(1,"this is the first room",[0,0,2,0])
room2 = Room.new(2,"this is the second room",[1,0,3,0])
room3 = Room.new(3,"this is third room",[2,0,4,0])
room4 = Room.new(4,"this is fourth room",[3,"e","e","e"])

simple_game = Game.new(room1)
rooms_array = [room1,room2,room3,room4]
simple_game.include_rooms(rooms_array)

simple_game.run_game






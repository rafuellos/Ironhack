require 'pry'
require 'highline/import'
require 'colorize'

class Slides
	def read_slides file
		@slide_text = IO.readlines(file).map(&:chomp)
		str.split(/\s+/, n+1)[0...n].join(' ')
		string[/(\S+\s+){#{n}}/].strip
		puts "I am now red.".red
	end
end

class TerminalManager
	def get_terminal_size
		terminal_size = HighLine::SystemExtensions.terminal_size

	end

	def center_info
	
	end

	def do_presentation slides_deck
		@slides = slides_deck.slide_text


	end

end


slides_file = "slides.txt"
puts Slides.read_slides slides_file


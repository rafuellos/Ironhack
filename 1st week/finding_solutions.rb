require 'pry'

def  my_method
	puts "ruby".concat("is awesome")

	binding.pry
	letters_array = ("a".."z").to_a
	letters_array.each do |letter|
		binding.pry
		puts letter
	end
end



my_method
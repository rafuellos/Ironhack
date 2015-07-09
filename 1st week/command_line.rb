require 'pry'

class CommandLine 
	
	def initialize users_names, users_and_passwords
		@users_and_passwords = users_and_passwords
		@users_names = users_names

	end

	def get_input
		gets.chomp
	end

	def ask_user
		puts "Please introduce your user name:\n>"
		@user = get_input
	end

	def ask_password
		puts "Now introduce your password:\n>"
		@password = get_input
	end

	def search_user
		if @users_names.include? @user
			ask_password
		else puts "There is no #{@user} in our database"
			ask_user
		end
	end
	
	def get_password 
		@input_password = @users_and_passwords[@user]
	end


	def compare_password
		if @password == @input_password 
			create_menu
		else 
			puts "The password do not match the user. Try again"
			ask_user
		end
	end
	def create_menu
		puts "+++++++++++++++++++++++\n"
		puts "| Select an option    |\n"
		puts "| 1 - Count words     |\n"
		puts "| 2 - Count letters   |\n"
		puts "| 3 - Reverse text    |\n"
		puts "| 4 - Uppercase text  |\n"
		puts "| 5 - Lowercase text  |\n"
		puts "+++++++++++++++++++++++\n"
		get_option
	end
	def get_option
		option_number = get_input
		select_option option_number
	end

	def select_option option_number
		case option_number
		when "1"
			@option_text = "Count words"
			enter_text
			count_words
		when "2"
			@option_text = "Count letters"
			enter_text
			count_lleters
		when "3"
			@option_text = "Reverse"
			enter_text
			reverse_text
		when "4"
			@option_text = "Uppercase"
			enter_text
			uppercase_text
		when "5"
			@option_text = "Lowercase"
			enter_text
			lowercase_text
		when "Q"
			puts "See you!"
			exit
		else 
			puts "Invalid option try a new one:"
			get_option
		end
	end

	def enter_text
		puts "Please enter a text to #{@option_text}:\n>"
		@text = get_input
	end

	def count_words
		puts @text.split.length
	end
	def count_letters
		puts @text.length
	end
	def reverse_text
		puts @text.reverse
	end
	def uppercase_text
		puts @text.upcase
	end
	def lowercase_text
		puts @text.downcase
	end


	def starts_prompt
		puts "Welcome to our platform"
		ask_user
		search_user
		get_password
		compare_password

	end

end

class User
	attr_accessor :user, :password
	def intialize user, password
		@user = user
		@password = password
	end
	
end


class DatabaseCreator 
	attr_accessor :usersdatabase
	def initialize
		@usersdatabase = []
	end
	def include_user user
		@usersdatabase << user.name

		
	end
end

users = ["Ralph", "Sergei"]
passwords = ["123" , "456"]
passwords2 = IO.read("passwords.txt").split

users_and_passwords = Hash[users.zip(passwords)] 
CommandLine.new(users, users_and_passwords).starts_prompt
require 'pry'


class Post
	attr_accessor :date, :title, :text, :sponsored
	def initialize date, title, text, sponsored
		@date = date
		@title = title
		@text = text
		@sponsored = sponsored 
	end
end
	

class Blog
	def initialize
		@blog_page = []
	end

	def include_post post
		@blog_page << post
		
	end

	def sort_posts
		@blog_page = @blog_page.sort_by {|post| post.date}.reverse
	end

	def format_post post
		format = ""
		if post.sponsored
			post.title = "+++++++++" + post.title + "+++++++++"
	
		end
		format = post.title + "\n********* \n" + post.text + "\n--------------- \n"

	end

	def create_front_page
		sort_posts
		frontpage = ""
		@blog_page.each do |post|
			frontpage += format_post post
			#post.title + "\n********* \n" + post.text + "\n--------------- \n"
		end
		publish_front_page frontpage

	end

	def publish_front_page page
		puts page
	end
end

ironhack_blog = Blog.new
ironhack_blog.include_post Post.new("22/12/2015", "My first post", "Loremipsum, Loremipsum", true)
ironhack_blog.include_post Post.new("24/12/2015", "My second post", "Loremipsum, Loremipsum Loremipsum", true)
ironhack_blog.include_post Post.new("20/11/2015", "My third post", "Loremipsum, Loremipsum Loremipsum, Loremipsum", false)
ironhack_blog.create_front_page	

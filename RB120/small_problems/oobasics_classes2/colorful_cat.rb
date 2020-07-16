
class Cat
	COLOR = "black"
	attr_accessor :name

	def initialize(n)
		@name = n
	end

	def greet
		puts "Hello! My name is #{name} and I'm a #{COLOR} cat."
	end
end

kitty = Cat.new('Sophie')
kitty.greet
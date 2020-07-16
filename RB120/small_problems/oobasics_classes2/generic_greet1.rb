class Cat
	def self.generic_greeting
		puts "Hello! I'm a cat!"
	end
end
Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting
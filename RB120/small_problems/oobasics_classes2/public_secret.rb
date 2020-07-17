class Person
	attr_accessor :secret

	def secret
		@secret
	end
end


person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret


class Person
	def secret
		@secret
	end

	def set_secret=(secret) # manually using a setter method
		@secret
	end
end
person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

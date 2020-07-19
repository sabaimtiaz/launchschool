class Person
	attr_accessor :name
	
	def name=(name)
		@name = name.capitalize
	end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
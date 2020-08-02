class Transform
	def initialize(string)
		@string = string
	end

	def uppercase
		@string.upcase
	end

	def self.lowercase(string) # class method
		string.downcase
	end
end
 
my_data = Transform.new("abc")
p my_data.uppercase
puts Transform.lowercase("XYZ") 
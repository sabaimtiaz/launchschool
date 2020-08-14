class Cube
	#attr_reader :volume # add an attr_reader or attr_accessor method 
	def initialize(volume)
		@volume = volume
	end

# getter method
	def get_volume
		@volume
	end
end
cube = Cube.new(5)
p cube.get_volume
class DNA
	attr_accessor :string

	def initialize(string)
		@string = string
	end

	def hamming_distance(other_string)
		given_string = string.chars
		other_string = other_string.chars
		diff = [given_string.size, other_string.size].min 
		count = 0
		diff.times do |idx|
			count += 1 if given_string[idx] != other_string[idx]
		end
		count
	end
end


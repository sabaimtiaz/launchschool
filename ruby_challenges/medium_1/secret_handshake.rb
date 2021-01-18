class SecretHandshake
	attr_accessor :value

	CLUES = {1=>"wink", 10=>"double blink", 100=>"close your eyes", 1000=>"jump"}
	ITEMS = [1000, 100, 10, 1]

	def initialize(value)
		@value = value
	end

	def commands
		return [] if check_if_word
		value = @value.to_i.to_s(2)
		if value.size >= 5
		  bin = (value.to_i - 10000)
		  rev = 1
		else
			bin = value.to_i
		end

		result = []
		ITEMS.each do |num|
			if bin - num > 0 && rev == 1
				result << CLUES[num]
			elsif bin - num > 0
				result << CLUES[bin - num] 
			elsif bin == num
				result << CLUES[bin]
			end
		end
		result.compact
	end

	def check_if_word
		value.to_i.zero?
	end
end
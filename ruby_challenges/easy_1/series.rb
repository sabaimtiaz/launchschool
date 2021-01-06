class Series
	attr_accessor :string
	def initialize(str)
		@string = str
	end

	def slices(num)
		result = []
		if num <= @string.chars.length
			@string.chars.each_cons(num) { |a| result << a }
			result.map { |subarr| subarr.map { |elem| elem.to_i} }
		else
		  raise ArgumentError
		end
	end
end


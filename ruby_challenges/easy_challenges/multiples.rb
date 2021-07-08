class SumOfMultiples
	attr_accessor :nums

	def initialize(*nums)
		@nums = nums.empty? ? [3, 5] : nums
	end

	def self.to(max)
		SumOfMultiples.new.to(max)
	end

	def to(max)
		(1...max).select do |int| 
			nums.any? {|num| int % num == 0}
		end.sum
	end
end

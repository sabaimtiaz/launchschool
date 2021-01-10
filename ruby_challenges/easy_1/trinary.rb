class Trinary
	attr_accessor :num

	def initialize(num)
		@num = num
	end

	def to_decimal
		return 0 if is_invalid?
		digits = num.chars.map { |elem| elem.to_i }.reverse
		digits.map.with_index do |num, idx|
			num * 3 ** idx
		end.sum
	end

	def is_invalid?
		num.match(/[^012]/)
	end
end

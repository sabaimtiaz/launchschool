class Octal
	attr_accessor :num

	def initialize(num)
		@num = num
	end

	def to_decimal
		return 0 if is_valid?
		digits = num.chars.map { |elem| elem.to_i }.reverse
		digits.map.with_index do |num, idx|
			num * 8 ** idx
		end.sum
	end

	private
	def is_valid?
		num.match(/[a-z]/) || num.match(/[9]/) || num.to_i == 8
	end
end

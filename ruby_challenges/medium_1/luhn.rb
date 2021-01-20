class Luhn
	attr_accessor :number, :result

	def initialize(number)
		@number = number
	end

	def valid?
		checksum % 10 == 0
	end

	def addends
		@result = []
		number = @number.digits.reverse
		number.reverse_each.with_index do |num, idx|
			if idx.even?
				result << num
			elsif idx.odd?
				doubled = num * 2
				doubled -= 9 if doubled >= 10
				result << doubled
			end
		end
		result.reverse!
	end

	def checksum
		addends.sum
	end

	def self.create(number)
		elem = self.new(number)
		str = elem.number.to_s
		(0...10).select do |digit|
			new_number = (str + digit.to_s).to_i
			return new_number if self.new(new_number).valid?
		end
	end
end
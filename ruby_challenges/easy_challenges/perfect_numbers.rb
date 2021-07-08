require 'prime'

class PerfectNumber

	def self.classify(number)
		raise StandardError if number < 0
		divs = self.divisors(number).sum
		case 
		when divs == number
			"perfect"
		when divs > number
			"abundant"
		when divs < number || divs.prime?
			"deficient"
		end
	end

	def self.divisors(number)
		self.new.divisors(number)
	end

	def divisors(number)
		(1...number).select do |num|
			(number % num) == 0
		end
	end
end


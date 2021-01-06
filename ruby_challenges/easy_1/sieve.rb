

class Sieve
	attr_accessor :limit, :array

	def initialize(limit)
		@limit = limit
	end

	def generate_array
		@array = (2..limit).to_a
	end

	def primes
		generate_array
		array.each do |num|
			array.reject! do |elem|
				(elem != num) && (elem % num == 0)
			end
		end
		array
	end
end


primes = Sieve.new(10)
p primes.primes

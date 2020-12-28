def divisors(int)
	counter = 1
	result = []
	while counter <= int
		result << counter if int % counter == 0
		counter += 1
	end
	result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# divisors(999962000357)

def divisors(int)
	result = []
	1.upto(Math.sqrt(int)).each do |num|
		result << int/num << num if int % num == 0
	end
	result.sort
end

p divisors(7)
p divisors(999962000357)
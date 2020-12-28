def compute
	return "Does not compute." unless block_given?
	yield
end

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

def compute(arg)
	yield(arg+1)
end

compute(4) do |num|
	puts num
end

def compute(number)
	if block_given?
		yield(number * 3)
	else
		number + number
	end
end

p compute(5)
p compute(5) { |num| num}
p compute(3) { |num| num * 5 }
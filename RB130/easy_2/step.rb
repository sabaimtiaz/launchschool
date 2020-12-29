
def step(starting, ending, step)
	val = starting
	loop do
		yield(val)
		break if val + step > ending
		val += step
	end
	val
end


p step(1, 10, 3) { |value| puts "value = #{value}"}
factorials = Enumerator.new do |y|
	number = 0
	product = 1

	loop do
		product = number.zero? ? 1 : product * number
		y << product
		number += 1
	end
end

6.times {|number| p "#{number}-->#{factorials.next}" }
factorials.rewind

6.times {|number| p "#{number}-->#{factorials.next}" }

factorials.each_with_index do |val, num|
	puts "#{num} = #{val}"
	break if num >=5
end

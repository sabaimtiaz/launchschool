def each_with_index(array)
	counter = 0
	array.each do |elem|
		yield(elem, counter)
		counter += 1
	end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
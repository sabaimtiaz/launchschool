def map(collection)
	result = []
	collection.each do |value|
		result << yield(value)
	end
	result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({"coffee"=>"5"}) { |key, value| [key, value.to_i] }.to_h

def map(collection)
	collection.each.with_object([]) do |value, obj|
		obj << yield(value)
	end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]

def count(collection)
	result = 0
	collection.each do |num|
		result += 1 if yield(num)
	end
	result
end
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

def count_items(array)
	result = 0
	array.size.times do |num|
		result += 1 if yield(array[num])
	end
	result
end
p count_items([1,2,3,4,5]) { |value| value.odd? } == 3
p count_items([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count_items([1,2,3,4,5]) { |value| true } == 5
p count_items([1,2,3,4,5]) { |value| false } == 0
p count_items([]) { |value| value.even? } == 0
p count_items(%w(Four score and seven)) { |value| value.size == 5 } == 2



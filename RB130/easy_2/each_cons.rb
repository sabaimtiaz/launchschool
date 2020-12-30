

# def each_cons(array)
# 	return nil if array.empty?
# 	start = 0
# 	ending = 1
# 	result = []
# 	loop do
# 		result << yield(array[start..ending])
# 		start += 1
# 		ending += 1
# 		break if start == array.size-1
# 	end
# 	result
# end


def each_cons(array)
	array.each.with_index do |item, idx|
		break if array.size == idx + 1
		yield(item, array[idx+1])
	end
	nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
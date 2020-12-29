def zip(array1, array2)
	result = []
	array1.each.with_index do |num, idx|
		result << [num, array2[idx]] 
	end
	result
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
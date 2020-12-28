# def missing(array)
# 	missing_nums = (array[0]..array[-1]).each_cons(1).to_a.flatten
# 	missing_nums - array
# end

def missing(array)
	(array[0]..array[-1]).to_a - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
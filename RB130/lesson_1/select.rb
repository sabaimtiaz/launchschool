def select(array)
	result = []
	array.each do |num|
		result << num if yield(num)
	end
	p result
end
array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      
select(array) { |num| puts num }     
select(array) { |num| num + 1 }     
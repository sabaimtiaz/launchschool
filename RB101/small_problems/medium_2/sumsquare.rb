def sum_square_difference(num)
  array_sum = []
  1.upto(num) do |i| 
    array_sum << i
  end
  array_sq_sum = []
  for num in array_sum
    array_sq_sum << num ** 2
  end
 (array_sum.sum ** 2) - array_sq_sum.sum
end
p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(1)
p sum_square_difference(100)


# LS solution
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0
  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end
  sum**2 - sum_of_squares
end

p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(1)
p sum_square_difference(100)

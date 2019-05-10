# Write a method that takes an Array of numbers 
# returns the sum of the sums of each leading subsequence for that Array. 
# You may assume that the Array always contains at least one number.
def sum_of_sums(array)
  total = 0
  sum = 0
  counter = 0
  array.map do |num|
    sum += num
    total += sum
  end
  total
end
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# LS solution
def sum_of_sums(array)
  sum_total = 0
  1.upto(array.size) do |count|
    sum_total += array.slice(0, count).reduce(:+)
  end
  sum_total
end
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
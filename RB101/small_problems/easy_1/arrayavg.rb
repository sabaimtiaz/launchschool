# Write a method that takes one argument:
# an array containing integers
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers.
# problem 
# find the average of numbers in a given array
# input
# array
# output
# average of all numbers in the array
# data / test case
#average = [5, 2, 3]
#avg = average.sum / average.length
#puts "The average is #{avg}"
# algorith
# operate on each element of the array to add / then divide the total and output the number

def average(num)
  avg = num.sum/num.length
  puts "The average is #{avg}"
end

average([5, 2])
average([1, 5, 87, 45, 8, 8])
average([9, 47, 23, 95, 16, 52]) 

# ls solution
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  avg = sum / numbers.count
  puts avg
end

average([5, 2])
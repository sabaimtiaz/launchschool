# problem
# Write a method that searches for all multiples of 3 or 5
# that lie between 1 and some other number
# and then computes the sum of those multiples.
# test case
# For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# problem
# write a method that takes a number,
# and then looks for multiples of 3 and 5 between 1 and other number
# then it adds the multiples
# example 1.. 6
# multiples: 3, 5, 6
# sum = 14
# this i did by hand. now algorithm:
# find the numbers that if divided by 3 or 5 leave a remainder of 0
# use %

# code

def multisum(number)
  count = 0
  a = []
  loop do
    count += 1
    break if count == number + 1
    a.push(count)
  end
  threes = a.select { |num| num % 3 == 0 }
  fives = a.select { |num| num % 5 == 0 }
  p threes.push(fives).flatten.uniq.sum
end
multisum(3)
multisum(5)
multisum(10)
multisum(1000)

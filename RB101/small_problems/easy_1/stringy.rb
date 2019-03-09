# problem
# takes a positive integer

# input
# argument = positibve integer
# output 
# returns string of alt 1s and 0s
# conditional statement here that if the integer is positive the string begins with 1.
# length string = integer
# examples / test cases
# algo: 



def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    p number
 #   numbers << number
  end
  puts numbers.join
end
stringy(10)
stringy(6)
stringy(0)
stringy(7)


#def count(num)
 # num.times do |index|
  #  if index.even?
   #   puts 1
   # else 
    #  puts 0
  #end
#end
# end
#count(6)
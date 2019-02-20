a = [1, 4, 8, 11, 15, 19]
# value = a.bsearch { |x| x > 8 }
# use array#bsearch method
#takes the argument of the block 
#returns element of the array
value = a.bsearch { |element| element > 8 }
puts value

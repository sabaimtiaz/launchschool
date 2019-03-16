
# problem
# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 
# The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.
# test cases
# data = provided array
# algo - odd index
# code


def oddities(array)
  newarr = []
  array.map.with_index { |e, i| newarr << e if i.even?}
  p newarr
end
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

puts "---------"

def evens(array)
  newarr = []
  array.map.with_index { |e, i| newarr << e if i.odd?} 
  p newarr
end
evens([2, 3, 4, 5, 6])

puts "--"

def evens(array)
  array.select.with_index do |e, i|
    i.odd?
  end
end
p evens([2, 3, 4, 5, 6])
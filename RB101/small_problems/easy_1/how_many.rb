#problem

#write a method that counts the number of occurrences of each element in a given array.

# given an array with a certain number of elements
# count how many times that element occured in the array

# input - array

# output - the number of occurences and print the element name alongside

# test cases 

#elements(%w[coffee sugar tea icecream])
  #puts "#{arr.count(element)}"


def count_occurences(arr)
  occurences = {}

  arr.each do |element|
    occurences[element] = arr.count(element)
   end

  occurences.each do |element, count|
    puts "#{element} => #{count}"
    end
end

count_occurences(['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'])


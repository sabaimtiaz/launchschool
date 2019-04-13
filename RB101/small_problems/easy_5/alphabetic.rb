# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers
# sorted based on the English words for each number
# problem
# take an array as input with integers between 0 and 19
# convert each integer into its English word
# return this as an array
# this requires a data structure that would have the numbers
# and their corresponding english words
# a key-pair structure
# since its between 0-19 can write this easily
# then need to display the number as a word
# which would mean calling a method that every time it has an integer (key)
# it should display the corresponding value
# need to loop through the array
# given_array = [8, 18, 11]
# given_words = ["eight", "eighteen", "eleven", "one"]
# numbers = numbers_as_words.keys

def alphabetic_number_sort(numbers)
  numbers_as_words = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three",
                       4 => "four", 5 => "five", 6 => "six", 7 => "seven",
                       8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven",
                       12 => "twelve", 13 => "thirteen", 14 => "fourteen",
                       15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
                       18 => "eighteen", 19 => "nineteen" }
  new_arr = []
  result = []
  numbers.each do |num|
    if numbers_as_words.key?(num)
     new_arr << numbers_as_words[num]
    end
  end

  new_arr.sort.each do |word|
    if numbers_as_words.value?(word)
      result << numbers_as_words.key(word)
    end
  end
  result
end
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

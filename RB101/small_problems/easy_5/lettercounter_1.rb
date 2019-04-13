# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Examples
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }

# problem
# take a given string as input
# string has one or more words separated a sa string
# count the number of words of different sizes
# return this information as a hash
# need to run a loop to take words from the string and count them

def word_sizes(string)
  result = Hash.new(0)
  words = string.split(' ')
  words.each do |word|
    result[word.size] += 1
  end
  p result
end
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

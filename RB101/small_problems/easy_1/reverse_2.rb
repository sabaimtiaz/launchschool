# problem
# method that takes one arg
# input:
# string containing 1/more words
# output:
# returns string with 5 / more letter words reversed
# each string has letters and spaces
# only include spaces when there is more than 1 word
# examples given
# algorithm - split, reverse, size - length
# split the string
# count the size of the words
# only reverse words > 5 - conditional
# add spaces when string length has more than 1 word
# puts string.reverse #if string.length >= 5
# puts new_str.join(' ')

def reverse_words(string)
  words = []

  string.split(' ').each do |word|
    word.reverse! if word.length >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
puts reverse_words('coffee is a drink')

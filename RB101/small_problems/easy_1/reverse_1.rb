# problem
# write a method that takes a string as argument and returns
# a new string with the words in reverse order
# input - argument
# output - new string, words reversed
# test cases given
# process - reverse the string
# process - print the output
# code

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

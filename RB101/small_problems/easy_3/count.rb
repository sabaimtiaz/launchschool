# counting characters minus spaces
# test
# "coffee".length = 6
# "coffee is hot".length = 13
# need to remove spaces from the string
puts "Please write a word or words"
answer = gets.chomp
characters = answer.delete(' ').size
puts "There are #{characters} characters in '#{answer}'."


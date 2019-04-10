# Given a string of words separated by spaces, write a method that takes this string of words
 #and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word. 
# you may also assume that each string contains nothing but words and spaces

# problem
# input = string of word(s)
# output - every word in the string has a swapped first and last letter
# conditions
# at least one letter
# at least one word
# string = words and spaces
# explanation
# writing a method that takes a string and outputs a string. 
# we analyse each word and transform each word individually to swap the first and last letter
# test
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# string = "Abcde"

def swap_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  answer = words.split.map do |word|
    swap_characters(word)
  end
answer.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'




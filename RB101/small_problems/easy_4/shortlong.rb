# Write a method that takes two strings as arguments, determines the longest of the two strings,
# and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# gets a string and determines the length of the string
# then the program has to concat the short string, long string and short string
# test case
# strings of diff lengths
# algo

def short_long_short(words1, words2)
  if words1.length < words2.length
    newwords = words1 << words2 + words1
  else
    newwords = words2 << words1 + words2
  end
end
puts short_long_short('abc', 'defgh') #== "abcdefghabc"
puts short_long_short('abcde', 'fgh') # == "fghabcdefgh"
puts short_long_short('', 'xyz') #== "xyz"
puts short_long_short('coffee', 'hello its me')
puts short_long_short('abc', 'abc')
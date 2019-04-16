# Write a method that takes a string argument
# and returns a new string
# that contains the value of the original string 
# with all consecutive duplicate characters collapsed into a single character. 
# You may not use String#squeeze or String#squeeze!

# problem
# take a string as input
# remove all the consecutive duplicate characters
# return this as a new string

# expl
# the method takes a string argument
# we iterate over the string using a for loop to 
# examine the string 
# we can count the number of letters and delete if
# the count is over than 1
# then return a new string with the spaces removed
# look at using regexp potentially
# p string.match(/e{2,}/)

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  p crunch_text
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''


def crunch(text)
  crunched_arr = ''
  text.split("").each do |char|
    crunched_arr << char unless crunched_arr[-1] == char
  end
  p crunched_arr
end
crunch('ddaaiillyy ddoouubbllee') 
crunch('4444abcabccba') 
crunch('ggggggggggggggg') 
crunch('a')
crunch('')

def repeater(string)
  result = ''
  string.each_char do |char|
   result << char + char
 end
 result
end
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

def doublechar(string)
  consonants = %w(b c d f g h k j l m n p q r s t v w x y z)
  result = ''
  string.each_char do |char|
    result << char
    result << char if consonants.include?(char.downcase) 
  end
  result
end
p doublechar('String') == "SSttrrinngg"
p doublechar("Hello-World!") == "HHellllo-WWorrlldd!"
p doublechar("July 4th") == "JJullyy 4tthh"
p doublechar('') == ""
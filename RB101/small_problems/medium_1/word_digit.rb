DIGITS_TO_WORDS = { "one" => "1", "two" => "2", "three" => "3",
                    "four" => "4", "five" => "5", "six" => "6",
                    "seven" => "7", "eight" => "8", "nine" => "9" }
def word_to_digit(input)
  output = ''
  DIGITS_TO_WORDS.keys.each do |word|
    input.gsub!(/#{word}/, DIGITS_TO_WORDS[word])
  end
  # further exploration
  input.to_s.split(' ').each do |word|
    output << word + " " if /[a-z]/.match(word) || /[[:punct:]]/.match(word)
    output << word if DIGITS_TO_WORDS.values.include?(word)
  end
  if /\h[0-9]{8}\h/.match(output)
    output.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
  output.strip
end
p word_to_digit("pls call at one two five nine!")
p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit("Please call at one two three four five six seven eight nine nine.")

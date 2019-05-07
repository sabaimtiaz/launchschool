def word_cap(string)
  words = string.split(' ')
  string.clear
  for word in words
    word.capitalize!
  end
  words.map {|word| string << word + " "}
  string.strip
end
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# LS solution
def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# further
def word_cap(string)
  words_array = string.split(' ').map do |word| 
    word.downcase!
    n = word.length
    if word[0] =~ /[[:lower:]]/ 
      word[0].upcase! + word[1..n]
    else
      word
    end
  end
  words_array.join(' ')
end
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'



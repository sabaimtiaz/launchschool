# ("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

def word_lengths(string)
  words = []
  iterator = 0
  string.split(' ').each do |word|
    words[iterator] = "#{word} #{word.length}"
    iterator += 1
    break if iterator == string.length - 1 
  end
  words
end
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []
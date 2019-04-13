def word_sizes(string)
  result = Hash.new(0)
  words = string.gsub(/[^a-zA-Z[[:blank:]]]/,'')
  words.split(' ').each do |word|
    result[word.size] += 1
  end
  p result
end
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

# LS solution
def word_sizes(string)
  result = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    result[clean_word.size] += 1
  end
  p result
end
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

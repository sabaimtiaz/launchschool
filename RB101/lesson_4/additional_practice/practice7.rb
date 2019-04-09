result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
statement = "The Flintstones Rock"
letters.each do |letter|
  letter_freq = statement.scan(letter).count
  result[letter] = letter_freq if letter_freq > 0
end
p result

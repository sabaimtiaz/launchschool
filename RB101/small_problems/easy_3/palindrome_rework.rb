def palindrome?(word)
  word.reverse == word
end
puts palindrome?("madam")
puts palindrome?("why")
puts palindrome?(["a1a1a1a"])
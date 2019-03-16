#Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
# A palindrome reads the same forward and backward. 
#For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
  if string.reverse == string
    return true
  else
    return false
  end
end
puts palindrome?("madam") == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
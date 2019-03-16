#Write a method that returns true if its integer argument is palindromic, false otherwise. 
#A palindromic number reads the same forwards and backwards.

def palindromic_number?(num)
  if num.to_s == num.to_s.reverse
    return true
  else 
    return false
  end
end
puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(001100) == true

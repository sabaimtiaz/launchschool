def palindrome?(string)
  if string.reverse == string
    return true
  else
    return false
  end
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           
p real_palindrome?("Madam, I'm Adam") == true 
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
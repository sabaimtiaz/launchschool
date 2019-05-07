
def letter_case_count(string)
  uppercase = []
  lowercase = []
  neither = []
  hash_result = {}
  chars = string.chars
  for char in chars
   if /[[:upper:]]/.match(char)
    uppercase << char
  elsif /[[:lower:]]/.match(char)
    lowercase << char
  else
    neither << char
  end
  end

  lowercase.each do |element|
    hash_result[:lowercase] = lowercase.count
  end
  lowercase

  uppercase.each do |element|
    hash_result[:uppercase] = uppercase.count
  end

  neither.each do |element|
    hash_result[:neither] = neither.count
  end
  p hash_result
end
letter_case_count('abCdef 123') 
letter_case_count('AbCd +Ef') 
letter_case_count('123')
letter_case_count('')

# my error is that it is only counting the lowercase/uppercase and if it doesn't return a match it returns nothing.

# LS solution
def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/}
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/}
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}
  p counts
end

letter_case_count('abCdef 123') 
letter_case_count('AbCd +Ef') 
letter_case_count('123')
letter_case_count('')

  
  
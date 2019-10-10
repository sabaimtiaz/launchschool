def letter_percentages(string)
  percentages = {}
  characters = string.chars
  length = string.length
  percentages[:lowercase] = ((characters.count { |char| char =~ /[a-z]/}) / length.to_f * 100).round(2)
  percentages[:uppercase] = ((characters.count { |char| char =~ /[A-Z]/}) / length.to_f * 100).round(2)
  percentages[:neither] = ((characters.count { |char| char =~ /[^A-Za-z]/}) / length.to_f * 100).round(2)
  p percentages
end
letter_percentages("ABCDabcd")
letter_percentages("abcdefGHI")
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

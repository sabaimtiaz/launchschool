def swapcase(string)
  alpha = ('A'..'Z').to_a
  chars = string.chars
  chars.map do |char|
    if alpha.include?(char)
      char.downcase!
    elsif
      char.upcase!
    end
  end
  string = chars.join('')
  string
end
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# LS solution
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join('')
end
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

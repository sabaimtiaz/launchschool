def center_of(string)
  if string.length.odd?
    string[string.length/2]
  elsif string.length.even?
    string[(string.length/2)-1] + string[string.length/2] 
  end
end
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# LS solution
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end
p center_of('I love ruby')

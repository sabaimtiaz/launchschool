


#str = "---what's my +*& line?" # == ' what s my line '
#/[[^a-z]]/.match("---what's my +*& line?")

#puts str.gsub(/[^a-z]/, ' ').squeeze(' ')

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end
p cleanup("---what's my +*& line?") == ' what s my line '
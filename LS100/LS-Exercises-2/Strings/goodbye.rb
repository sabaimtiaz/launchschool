greeting = 'Hello!'
#greeting['Hello!'] = 'Goodbye!'
greeting.gsub!('Hello', 'Goodbye')
puts greeting
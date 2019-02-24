
def greetings(str)
  puts "Goodbye"
end

word = "Hello"
greetings(word)

--

def greetings(str)
  puts str
  puts "goodbye"
end

word = "Hello"
greetings(word)

--

def greetings
  puts "Goodbye"
end

word = "Hello"

greetings do 
  puts word
end

--
def greetings
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

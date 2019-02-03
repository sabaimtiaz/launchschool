def text(words)
  if words.length > 10
   puts words.upcase
 else 
  puts words
  end
end 

text("hello world")
text("Coffee is DeliCiOUs")
text("hi")
puts 'What is your name?'
username = gets.chomp
if username.include?('!')
  scream = username.upcase.chop
  puts "HELLO, #{scream}! WHY ARE WE SCREAMING?"
else
  puts "Hello, #{username}"
end

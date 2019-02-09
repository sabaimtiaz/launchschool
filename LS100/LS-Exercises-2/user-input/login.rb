username = "John"
password = "abcd"
loop do
puts "Please enter your user name"
get = gets.chomp.downcase
puts "Please enter your password"
pass = gets.chomp.downcase
if get == username && pass == password
  puts "You're in!"
else
  puts "Your username and/or password is incorrect. Try again."
end
end



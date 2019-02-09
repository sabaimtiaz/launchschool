
password = "abcd"
loop do
puts "Enter password"
get = gets.chomp
if get == password
  puts "You're in!"
else
  puts "Try again!"
end
end

loop do
puts "Do you want me to print something? (y/n)"
answer = gets.chomp
if answer.downcase == 'y'
  puts "something"
elsif answer.downcase == 'n'
  puts "Thank you, nothing will print"
break
else
  puts "This is not a valid answer"
end
end


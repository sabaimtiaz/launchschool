
puts "Enter a number between 1 to 5"
  x = gets.chomp.to_i
   while x > 0
    puts x
puts "Do you want to do that again? Press Y for yes and S to stop."
  answer = gets.chomp.to_s
 if answer == "S"
  break
end
end
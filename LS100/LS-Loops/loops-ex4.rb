
def countdown(x)
  puts x -=1 until x == 0
end

puts "Enter a number"
x = gets.chomp.to_i
countdown(x)
puts "Done!"


def countdown(x)
  if x <= 0
    puts x
 else
  puts x
  countdown(x -1)
  end
end

puts "Enter a number"
x = gets.chomp.to_i
countdown(x)
puts "Done!"

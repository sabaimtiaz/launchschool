x = gets.chomp.to_i

while x >= 0
  puts x
  x = x -= 1 #refactored from x = x-1
end

puts "Done!"
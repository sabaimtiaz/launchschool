puts "Enter a number"
num = gets.chomp.to_i
num = Math.sqrt(num).floor
#num = num.floor
puts "The square root is #{num}"
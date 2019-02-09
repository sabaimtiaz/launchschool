number = 0
loop do 
  puts "How many lines do you want, Enter a number that is at least 3"
  number = gets.chomp.to_i
break if number >= 3
puts "That's not enough lines"
next 
end


while number > 0
puts "Launch School is the best!"
number -=1 
end

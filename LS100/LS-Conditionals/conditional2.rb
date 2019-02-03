puts "Put in a number"
x = gets.chomp.to_i

#example 1
if x == 3
  puts "x is 3" 
end

#ex2
if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
end

#3
if x == 3
  puts "x is 3"
else
  puts "x is NOT 3" unless x == 3
end

#4 must use then keyword
if x == 3 then puts "x is 3" end

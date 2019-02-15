
count = 0
product = 1

puts "Enter a number"
number = gets.chomp.to_i

number.times do 
  count += 1
  product *= count
end
puts "#{number}! = #{product.to_s}"
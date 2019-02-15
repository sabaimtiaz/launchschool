number = 6
count = 0
product = 1

number.times do 
  count += 1
  product *= count
end
puts number.to_s 
puts product.to_s

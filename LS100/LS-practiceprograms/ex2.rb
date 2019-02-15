count = sum = 0
100.times do
  count+= 10
  sum+= count
  puts "sum at " + count.to_s + " = " + sum.to_s
end

def negative(num)
  if num > 0
    num = 0 - num
  elsif num < 0 || num == 0
    num
  end
  num
end
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      

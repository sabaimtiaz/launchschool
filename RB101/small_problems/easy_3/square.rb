def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end
puts square(5) == 25
puts square(-8) == 64

def exponent(num1, num2)
  multiply(num1, 1) ** multiply(1, num2)
end
puts exponent(5,2)
puts exponent(4, 2)
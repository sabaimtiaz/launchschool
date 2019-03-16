# exclusive or
def xor?(num1, num2)
  (num1 && !num2) || (num2 && !num1)
end
puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)
puts xor?(6.even?, 3.even?)
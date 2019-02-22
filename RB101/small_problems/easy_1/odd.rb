# problem - takes one integer argument
# returns true if the absolute value is odd
# cannot use odd? or even?
# test cases

def is_odd(num)
  if num % 2 == 1
    puts true
  else
    puts false
  end
end

puts is_odd(32)
puts is_odd(-16)
puts is_odd(39)
puts is_odd(42)
puts is_odd(9)
puts is_odd(0)
puts is_odd(-444)

puts '-----------'

def is_odd?(num)
  if num.odd? then true
  else false
  end
end

puts is_odd?(32)
puts is_odd?(-16)
puts is_odd?(39)
puts is_odd?(42)
puts is_odd?(9)
puts is_odd?(0)
puts is_odd?(-444)

puts '---------------'

def remainder_odd(num)
  if num.remainder(2) > 0 then true
  else false
  end
end

puts remainder_odd(32)
puts remainder_odd(-16)
puts remainder_odd(39)
puts remainder_odd(42)
puts remainder_odd(9)
puts remainder_odd(0)
puts remainder_odd(-444)

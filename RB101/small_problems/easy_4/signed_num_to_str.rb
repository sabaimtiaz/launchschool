def signed_integer_to_string(num)
  new_str = num.abs.digits.reverse.join
  if num == 0
    return "0"
  elsif num < 0
    "-" << new_str
  else
    "+" << new_str
  end
end
p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'

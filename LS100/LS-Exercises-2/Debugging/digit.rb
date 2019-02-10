def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i}
  product = 1

  digits.each do |digit|
    product *= digit #product = product * digit
  end

  product
end

p digit_product('12345')
#expected return value: 120
#actual return value: 0
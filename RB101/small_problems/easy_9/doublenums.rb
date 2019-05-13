def twice(num)
  num_str = num.to_s
  center = num_str.size/2
  left = num_str[0, center]
  right = num_str[center, center]
  if left == right && num_str.size.even?
    return num
  else
    num * 2
  end
end
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# LS
def twice(num)
  string_number = num.to_s
  center = string_number.size/2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]
  return num if left_side == right_side
  return num * 2
end
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

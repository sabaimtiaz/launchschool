
def rotate_rightmost_digits(int, n)
  (int.digits.reverse - [int.digits.reverse.slice(-n)] + [int.digits.reverse.slice(-n)]).join('').to_i
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  p number
end
max_rotation(735291)
max_rotation(3) 
max_rotation(35) 
max_rotation(105)  # the leading zero gets dropped
max_rotation(8_703_529_146)
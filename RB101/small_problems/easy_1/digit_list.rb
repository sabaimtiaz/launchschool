
# problem:
# Write a method that takes one argument - a positive integer
# and returns a list of the digits in the number

# examples / test case

def digit_list(num)
  num = num.to_s()
  arr = num.split('').map(&:to_i)
  p arr
end
digit_list(1234)
digit_list(222)
digit_list(111111)
digit_list(abc)



# input string
# input integer
# print string as many times as integer

def repeat(string, num)
  if num < 0
    puts 'The number is not a positive integer'
  else
    puts 'The number is a positive integer'
  end
  num.times do
    puts string
  end
end

repeat('Hello', 3)
# repeat('Hello', -200)

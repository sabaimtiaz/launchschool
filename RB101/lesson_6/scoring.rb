
# def scoring(num)
#   num = 0
#   loop do 
#   a = a + num
#   a
#   break if a == 10
# end
# a
# end
# puts scoring(1)


def scoring(score)
  if score == "false"
    score = 0
    score += 1
    puts "The score is #{score}"
  end
end
scoring("false")

def result(num1, num2)
  if num1 + num2 > 5
    p true
  else
    p false
  end
end
result(1, 1)

def score(num1, num2)
  if !result(num1, num2) 
    num3 = 0
    num3 += 1
    puts num3
  else
    puts "The result doesnt work"
  end
end
 score(1, 1)
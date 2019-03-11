# bonus
# # problem
# two args - a positive interger and a boolean
# calculates bonus for a salary
# if true, bonus should be half the salary
# if boolean false, bonus is 0
# input
# positive integer, boolean
# output
# bonus amount
# need to test against a condition and then calculate the bonus
# test 

#performance = ["good", "bad"]
#answer = gets.chomp
#salary = 10000
#if answer.include?("good")
 # bonus = salary/2
 # puts bonus
#else
 # puts 0
#end

def calculate_bonus(num, eval)
  if eval == true # bonus ? (salary / 2) : 0
    num/2
  else
    0
  end
end
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

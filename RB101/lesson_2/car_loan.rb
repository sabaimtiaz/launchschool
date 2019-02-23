# inputs:
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration

# Output
# monthly interest rate
# loan duration in months

# Process
# calculate
# m = monthly payment
# j = monthly interest rate
# n = loan duration (calculate it from whatever format provided into months)

# PEDAC
# problem-build a payment calculator
# take input from user
# run basic arithmetic ops and conversions before algo
# output result

# Examples/test cases

# INTRATE = 0.02
# def car_loan(loan)
# puts loan * INTRATE
# end

# car_loan(2222)

# Data - we need from inputs
# loan amount
# APR
# loan duration

# process
# validate inputs
# loan amount
# apr --> monthly rate
# loan duration --> months

# Algorithm:
# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def valid_input?(input)
  input.to_s() && input != 0
end

def valid_number?(num)
  num.to_i() != 0
end

loop do
  puts "Welcome to the Car Loan Calculator"

  carloan = ''

  loop do
    puts "What is the amount of your car loan?"
    carloan = gets.chomp.to_i()
    # puts "Your car loan is #{carloan} dollars."
    # if carloan > 0
    if valid_input?(carloan) && valid_number?(carloan)
      break
    else
      puts "Incorrect number. Please enter the correct number"
    end
  end

  loan_period = ''

  loop do
    puts "What is the period of your loan? Please enter in years."
    loan_period = gets.chomp.to_i()
    if valid_input?(loan_period) && valid_number?(loan_period)
      break
    else
      puts "Please enter the correct period"
    end
  end

  loan_months = loan_period * 12
  puts "Your car loan duration is #{loan_months} months."

  int_rate = ''
  loop do
    puts "What is the Annual Percentage Rate?"
    int_rate = gets.chomp.to_f()
    if valid_input?(int_rate) && valid_number?(int_rate)
      break
    else
      puts "Please enter the correct rate"
    end
  end
  int_rate_output = int_rate/12
  int_rate = (int_rate / 12) / 100

  puts "Your monthly interest rate is #{int_rate_output.round(2)}%"
  monthly_payment = carloan * (int_rate / (1 - (1 + int_rate)**-loan_months))
  puts "Your monthly payment is #{monthly_payment.round(2)}"

  puts "Would you like to do another calculation?"
  puts "Press y if yes. Press any key to exit."
  answer = gets.chomp.to_s()
  break unless answer.downcase().start_with?('y')
end
puts "Thank you. For more information about loans, visit placeholdersite.com"

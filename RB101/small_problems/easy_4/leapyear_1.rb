# problem
# write a method that takes a year and tells you if its a leap year or not
# explanation
# leap years take place in years evenly divisible by 4
# (with a 100 exception, in which case divide by 400)
# input - year
# output - true / false
# the conditions are
# year is greater than 0
# year divisible by 4 - remainder 0
# year divisible by 400 - remainder 0
# year divisible by 100 - has to be false
# test code
def leap_year?(year)
  if year < 0
    puts 'Invalid'
  elsif year % 400 == 0
    puts 'true'
  elsif year % 100 == 0
    puts 'false'
  elsif year % 4 == 0
    puts 'true'
  else
    puts 'false'
  end
end
leap_year?(2016)
leap_year?(2015)
leap_year?(2100)
leap_year?(2400)
leap_year?(240000)
leap_year?(240001)
leap_year?(2000)
leap_year?(1900)
leap_year?(1752)
leap_year?(1700)
leap_year?(1)
leap_year?(100)
leap_year?(400)
leap_year?(-1)

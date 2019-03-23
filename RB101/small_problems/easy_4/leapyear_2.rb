# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. 
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.
# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

def leap_year?(year)
  if year < 0
    puts 'Invalid'
  elsif year < 1752 && year % 4 == 0
    puts 'true'
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
leap_year?(1628)
leap_year?(100)
leap_year?(400)
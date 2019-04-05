# The time of day can be represented as the number of minutes before or after midnight. 
# If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format 
# and returns the time of day in 24 hour format (hh:mm). 
# Your method should work with any integer input.
# You may not use ruby's Date and Time classes.

# problem
#take an integer and return this as the time of the day as hh:mm
# if the number is negative then it is before midnight
# if it is positive then it is after mifnight
# examples
# time_of_day(-3) == "23:57"
# input = number
# output = time before/after midnight
# use if statements to set conditions

# 1 hour = 60 minutes
# 1 day = 24 hours
# 1 day = 24*60 minutes
# 1 day = 1440 minutes

# minutes = 800
# we know that positive minutes are after midnight
# so what we need is to divide those minutes by hours

MINUTES = 3000
HOURS_MINS = 60
DAY_MINS = 1440

def time(input_mins)
  time_mins = input_mins % DAY_MINS 
  hours, mins = time_mins.divmod(HOURS_MINS)
  format('%02d:%02d', hours, mins)
end
p time(800)
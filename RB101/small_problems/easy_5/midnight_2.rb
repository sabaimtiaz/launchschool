# problem
# take the time of the day and return it as an integer
# input = number
# output = time before/after midnight
# use if statements to set conditions
# range - 0.. 1439

# 1 hour = 60 minutes
# 1 day = 24 hours
# 1 day = 24*60 minutes
# 1 day = 1440 minutes

MINUTES = 3000
HOURS_MINS = 60
DAY_MINS = 1440



def after_midnight(input_mins)
  hours = input_mins.slice(0..1).to_i
  minutes = input_mins.slice(3..4).to_i
  (hours * HOURS_MINS + minutes) % DAY_MINS
end

def before_midnight(input_mins)
  hours = input_mins.slice(0..1).to_i
  minutes = input_mins.slice(3..4).to_i
  (DAY_MINS - (hours * HOURS_MINS + minutes)) % DAY_MINS
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
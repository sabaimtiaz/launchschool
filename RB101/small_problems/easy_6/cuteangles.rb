
# Write a method that takes a floating point number 
# that represents an angle between 0 and 360 degrees 
# and returns a String that represents that angle 
# in degrees, minutes and seconds. 
# You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes
# and a double quote (") to represent seconds.
# A degree has 60 minutes, 
# while a minute has 60 seconds.

DEGREE = "\xC2\xB0"

def dms(degree)
  degree_decimal = degree - degree.floor
  minutes = degree_decimal * 60
  degree_remaining = minutes - minutes.floor
  seconds = degree_remaining * 60
  puts format(%(#{degree.round}#{DEGREE}%02d'%02d"), minutes.floor, seconds.floor)
end
dms(121.35)
dms(30)
dms(76.73)
dms(93.034773)
dms(0)
dms(360)

# LS solution

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  puts format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
dms(121.35)
dms(30)
dms(76.73)
dms(93.034773)
dms(0)
dms(360)

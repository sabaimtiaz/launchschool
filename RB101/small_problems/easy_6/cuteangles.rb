
# Write a method that takes a floating point number 
# that represents an angle between 0 and 360 degrees 
# and returns a String that represents that angle 
# in degrees, minutes and seconds. 
# You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes
# and a double quote (") to represent seconds.
# A degree has 60 minutes, 
# while a minute has 60 seconds.

DEGREE_SYM = "\xC2\xB0"

def dms(degree)
  degree_decimal = degree - degree.floor
  minutes = degree_decimal * 60
  degree_remaining = minutes - minutes.floor
  seconds = degree_remaining * 60
  puts format(%(#{degree.round}#{DEGREE_SYM}%02d'%02d"), minutes.floor, seconds.floor)
end
dms(121.35)
dms(30)
dms(76.73)
dms(93.034773)
dms(0)
dms(360)
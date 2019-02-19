require 'date'

puts Date.new #everything defaults, year defaults to Julian calendar
puts Date.new(2016) #month given, defaults to first month
puts Date.new(2016, 5) #month and day given, defaults to first day
puts Date.new(2016, 5, 13) #nothing defaults
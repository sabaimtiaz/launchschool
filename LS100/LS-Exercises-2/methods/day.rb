def time_of_day(daylight)
  if daylight #can change paramaeter name to daytime
    puts "It's daytime"
  else
    puts "It's nighttime!"
    end
  end

daylight = [true, false].sample
#puts daylight (to see assignment of true or false)
time_of_day(daylight)
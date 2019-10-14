def friday_13th(year)
  day = 13
  month = 0
  count = 0
  12.times do
    month += 1
    count += 1 if Time.new(year, month, day).friday? 
  end
  count
end
friday_13th(2015)
friday_13th(1986)
friday_13th(2019)

# further exploration
# def five_fridays(year)
#   day = 0
#   month = 0
#   count = 0
#   12.times do
#     day += 1 
#     month += 1
#     count += 1 if Time.new(year, month, day).friday?
#   end
#   p count
# end
# five_fridays(1986)

def five_fridays(year)
  days = (1..31)
  months = (1..12)
  count = 0
  count_year = 0
  # count_leap_year = 0
  months.map do |month|  
    days.map do |day|
      count +=1 if Time.new(year, month, day).friday?
      # count_year +=1 if Time.new(year, 1, 1).friday? && year % 4 != 0
      # count_leap_year +=1 if Time.new(year, 1, 1).friday? && year % 4 == 0
      # count_leap_year += 1 if Time.new(year, 1, 2).friday? && year % 4 == 0
   end
  end
 p count > 52 ? true : false
end
five_fridays(1997)
five_fridays(2019)
five_fridays(1997)
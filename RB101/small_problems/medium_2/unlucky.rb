def friday_13th(year)
  day = 13
  month = 0
  count = 0
  12.times do
    month += 1
    count += 1 if Time.new(year, month, day).friday?  
  end
  p count
end
friday_13th(2015)
friday_13th(1986)
friday_13th(2019)


=begin


    April, June, September, and November have 30 days.
    February has 28 in most years, but 29 in leap years.
    All the other months have 31 days.
    The first day of the week of the month (DOWM) is always between the 1st and 7th of the month.
    The second DOWM is between the 8th and 14th of the month.
    The third DOWM is between the 15th and 21st of the month.
    The fourth DOWM is between the 22nd and 28th of the month.
    The fifth DOWM is between the 29th and 31st of the month.
    The last DOWM is between the 22nd and the 31st of the month depending on the number of days in the month.

=end

require 'Date'

class Meetup

  attr_accessor :year, :month, :weekday, :schedule, :last_day
  SCHEDULE = {"first"=>1, "second"=>8, "third"=>15, "fourth"=>22, "fifth"=>29, "last"=>nil, "teenth"=>13}

  def initialize(year, month)
    @year = year
    @month = month
    @last_day = Date.civil(year, month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    array_of_dates = []
    counter = 1

    loop do 
      array_of_dates << Date.new(year, month, counter)
      counter += 1
      break if counter == last_day
    end
    array_of_dates.select { |date| which_day?(date, weekday) }[0]
  end

  def which_day?(date, weekday)
    case weekday
    when 'monday' then date.monday?
    when 'tuesday' then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday' then date.thursday?
    when 'friday' then date.friday?
    when 'saturday' then date.saturday?
    when 'sunday' then date.sunday?
    end
  end

end

calendar = Meetup.new(2021, 4)
p calendar.day("friday", "first")

#calendar.day("Monday", "first")
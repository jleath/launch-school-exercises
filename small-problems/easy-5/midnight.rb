require 'date'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(time)
  time = time % MINUTES_PER_DAY
  hours, minutes = time.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

def time_of_day_alt(time, weekday=false)
  origin_date = Date.new(2020,8,30)
  time_shift = time / MINUTES_PER_DAY.to_f
  adjusted_date = origin_date + time_shift
  if weekday
    adjusted_date.strftime("%A %R")
  else
    adjusted_date.strftime("%R")  
  end
end

puts time_of_day_alt(0) == '00:00'
puts time_of_day_alt(-3) == '23:57'
puts time_of_day_alt(35) == '00:35'
puts time_of_day_alt(-1437) == '00:03'
puts time_of_day_alt(3000) == '02:00'
puts time_of_day_alt(800) == '13:20'
puts time_of_day_alt(-4231) == '01:29'

puts time_of_day_alt(-4231, true) == 'Thursday 01:29'
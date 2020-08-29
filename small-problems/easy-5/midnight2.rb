HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
# After midnight
# split the string into hours and minutes
# convert the split strings into integers
# minutes = (hours * 60) % MINUTES_PER_DAY
# minutes += minutes

def interpret_time(text)
  values = text.split(':')
  return values[0].to_i, values[1].to_i
end

def after_midnight(text)
  hours, minutes = interpret_time(text)
  ((hours * MINUTES_PER_HOUR) % MINUTES_PER_DAY) + minutes
end

# Before Midnight
# split the string into hours and minutes
# convert the split strings into integers
def before_midnight(text)
  (MINUTES_PER_DAY - after_midnight(text)) % MINUTES_PER_DAY
end

puts after_midnight('00:00')
puts before_midnight('00:00')
puts after_midnight('12:34')
puts before_midnight('12:34')
puts after_midnight('24:00')
puts before_midnight('24:00')

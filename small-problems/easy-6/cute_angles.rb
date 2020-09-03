# Convert a floating point number representing an angle in degrees to
# degrees, minutes and seconds.

# degrees = floor(x)
# minutes = floor((x - degrees) * 60)
# seconds = (((x - degrees) * 60) - minutes) * 60

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60

def dms(x)
  degrees= x.truncate
  minutes = ((x - degrees) * 60).truncate
  seconds = ((((x - degrees) * 60) - minutes) * 60).truncate
  format("%d%s%02d'%02d\"", degrees, DEGREE, minutes, seconds)
end

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)
def get_suffix(n)
  return 'th' if [11, 12, 13].include?(n % 100)
  case n % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year)
  if year != 0 && year % 100 == 0
    century_num = year / 100
  else
    century_num = (year / 100) + 1
  end
  "#{century_num}#{get_suffix(century_num)}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
puts century(0) == '1st'
puts century(100) == '1st'
puts century(101) == '2nd'
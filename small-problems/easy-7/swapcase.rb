def my_swapcase(c)
  case c
  when /[a-z]/ then c.upcase
  when /[A-Z]/ then c.downcase
  else c
  end
end

puts my_swapcase('a') == 'A'
puts my_swapcase('A') == 'a'
puts my_swapcase('0') == '0'

def swapcase(str)
  swapped = ''
  str.each_char { |c| swapped << my_swapcase(c) }
  swapped
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
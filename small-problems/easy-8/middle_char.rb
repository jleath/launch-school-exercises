def center_of(str)
  mid = (str.size / 2.0).ceil - 1
  result_size = str.size.even? ? 2 : 1
  str[mid, result_size]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
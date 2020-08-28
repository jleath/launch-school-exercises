def short_long_short(str1, str2)
  if str1.size > str2.size
    shorter = str2
    longer = str1
  else
    shorter = str1
    longer = str2
  end
  return shorter + longer + shorter
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'
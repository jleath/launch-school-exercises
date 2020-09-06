def double_consonants(str)
  result = []
  str.chars.each do |c|
    if c.count('a-zA-z') > 0 && c.count('^aeiouAEIOU') > 0
      result << c * 2
    else
      result << c
    end
  end
  result.join('')
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
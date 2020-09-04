def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def my_capitalize(str)
  str.downcase!
  str[0] = str[0].upcase
  str
end

def word_cap(str)
  str.split.map { |word| my_capitalize(word) }.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# input: a string
# output: a hash with 3 entries:
#           - lowercase: the percentage of lowercase characters in the input text
#           - uppercase: the percentage of uppercase characters in the input text
#           - neither:   the percentage of all other characters in the input text

def letter_percentages(string)
  result = {}
  total_chars = string.size
  result[:lowercase] = ((string.count('a-z') / total_chars.to_f) * 100).round(2)
  result[:uppercase] = ((string.count('A-Z') / total_chars.to_f) * 100).round(2)
  result[:neither] = (100 - (result[:lowercase] + result[:uppercase])).round(2)
  result
end

puts letter_percentages('abCdef 123')  == { lowercase: 50.00, uppercase: 10.00, neither: 40.00 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.50, uppercase: 37.50, neither: 25.00 }
puts letter_percentages('123') == { lowercase: 0.00, uppercase: 0.00, neither: 100.00 }
puts letter_percentages('abcdefGHI')
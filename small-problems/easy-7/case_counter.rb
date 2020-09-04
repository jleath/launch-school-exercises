# input: a string
# output: a hash with 3 entries
#           - the number of characters in the string that are lowercase
#           - the number of characters in the string that are uppercase
#           - the number of characters that are neither

# characters that are neither consist of punctuation, whitespace, and digits
# the keys in the hash should be symbols named and ordered as: 
#    1. lowercase
#    2. uppercase 
#    3. neither
# the resulting hash should have these keys even if their values are 0

# initialize an empty hash with keys for uppercase, lowercase and neither
# set the initial values to 0
# starting with the first character
#  update the appropriate value in the hash
# repeat for all characters in the string
# return the hash

def letter_case_count(str)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |c|
    case c
    when 'a'..'z' then counts[:lowercase] += 1
    when 'A'..'Z' then counts[:uppercase] += 1
    else counts[:neither] += 1
    end
  end
  counts
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
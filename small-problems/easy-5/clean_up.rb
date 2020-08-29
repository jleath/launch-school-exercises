# Given a string, return a new string with all non-alphabetic characters
# replaced with a space. Consecutive non-alphabetic characters will be
# replaced with only one space.

# The input string may consist of multiple words, but each word will only
# consist of lowercase characters and symbols.
# The resulting string should have no consecutive spaces.

# Model
# initialize an empty string named result
# initialize a boolean named in_word to true
# for each character c in the input
#   if c is non-alphabetic
#     if in_word == true
#       append a space to result
#       set in_word to false
#   else
#     set in_word to true
#     append c to result
#   end
# end
# return result

def is_alpha(c)
  c.ord >= 'a'.ord && c.ord <= 'z'.ord
end

def cleanup(text)
  result = ''
  in_word = true
  text.each_char do |c|
    if is_alpha(c)
      in_word = true
      result << c
    elsif in_word
      in_word = false
      result << ' '
    end
  end
  result
end

# Test Cases
puts cleanup("---what's my +*& line?") == " what s my line "
puts cleanup("  hello     there  ? ? ? ") == " hello there "
puts cleanup("   ") == " "
puts cleanup("") == ""
puts cleanup("this is just normal text") == "this is just normal text"
# convert n to a string called digit_string
# for each index in the range 0 to digit_string.size
#   split digit_string into two parts, the first having index characters
#    and the second having digit_string.size - index characters
#   rotate the second string one position to the left
#   append the result of this rotation to the first string
# once iteration is complete, return the resulting string converted to an integer

def max_rotation(n)
  digit_string = n.to_s
  (0...digit_string.size).each do |index|
    left_side = digit_string.slice(0, index)
    right_side = digit_string.slice(index, digit_string.size - index)
    digit_string = left_side + rotate(right_side)
  end
  digit_string.to_i
end

def rotate(str)
  str.slice(1, str.size - 1) + str[0]
end
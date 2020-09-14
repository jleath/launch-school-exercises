# equilateral: all 3 sides equal length
# isosceles: 2 sides of equal length
# scalene: no equal length sides

# A valid triangle must have 3 sides with length greater than 0,
#  and the sum of the two shorter sides should be greater than the
#  length of the longest side

# check if triangle is valid, return :invalid if not
# determine the type of triangle and return the appropriate symbol

def triangle(l1, l2, l3)
  return :invalid unless valid_triangle?(l1, l2, l3)

  case num_unique_sides(l1, l2, l3)
  when 3 then :scalene
  when 2 then :isosceles
  else :equilateral
  end
end

def valid_triangle?(l1, l2, l3)
  lengths = [l1, l2, l3]
  longest_side = lengths.max
  if (lengths.select { |l| l > 0 }).size < 3
    false
  elsif (lengths.reduce(:+) - longest_side) < longest_side
    false
  else
    true
  end
end

def num_unique_sides(l1, l2, l3)
  [l1, l2, l3].uniq.size
end

puts valid_triangle?(0, 12, 14) == false
puts valid_triangle?(4, 4, 16) == false
puts valid_triangle?(2, 4, 5) == true

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
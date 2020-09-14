# right - one angle of the triangle is a right angle
# acute - all 3 angles are less than 90 degrees
# obtuse - one angle is greater than 90 degrees

# a valid triangle has 3 angles greater than 0 that sum to exactly
#   180 degrees.

# Given 3 integers representing the angles of a triangle in degrees,
#  return a symbol describing the type of the triangle

def right?(a1, a2, a3)
  [a1, a2, a3].count(90) == 1
end

def acute?(a1, a2, a3)
  [a1, a2, a3].all? { |angle| angle < 90 }
end

def obtuse?(a1, a2, a3)
  [a1, a2, a3].any? { |angle| angle > 90 }
end

def valid_triangle?(a1, a2, a3)
  [a1, a2, a3].all? { |angle| angle > 0 } && [a1, a2, a3].reduce(:+) == 180
end

def triangle(a1, a2, a3)
  return :invalid unless valid_triangle?(a1, a2, a3)

  case 
  when right?(a1, a2, a3) then :right
  when acute?(a1, a2, a3) then :acute
  when obtuse?(a1, a2, a3) then :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
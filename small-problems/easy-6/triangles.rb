# Given a method that takes a positive integer, n, display a right triangle whose sides
# each have n stars.

# ex: 5
#     *
#    **
#   ***
#  ****
# *****

def triangle(n, corner=1)
case corner
when 1 then 0.upto(n-1) { |i| puts "#{'*'*(n-i)}#{' '*i}" }
when 2 then 1.upto(n) { |i| puts "#{' '*(n-i)}#{'*'*i}" }
when 3 then 1.upto(n) { |i| puts "#{'*'*i}" }
when 4 then n.downto(1) { |i| puts "#{'*'*i}#{' '*(n-1)}" }
end
end

triangle(5, 1)
triangle(5, 2)
triangle(5, 3)
triangle(5, 4)
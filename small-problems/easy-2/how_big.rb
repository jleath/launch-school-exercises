SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144.0
SQINCHES_TO_SQCENT = 6.4516


puts "Enter the length of the room in feet:"
length_ft = gets.chomp.to_f

puts "Enter the width of the room in feet: "
width_ft = gets.chomp.to_f

area_foot = (length_ft * width_ft).round(2)
area_inch = (area_foot * SQFEET_TO_SQINCHES).round(2)
area_centimeter = (area_inch * SQFEET_TO_SQINCHES).round(2)

puts "The area of the room is: #{area_foot} square feet."
puts "                         #{area_inch} square inches."
puts "                         #{area_centimeter} square centimeters."

require 'date'

print 'What is your age? '
age = gets.chomp.to_i

print 'At what age would you like to retire? '
retirement_age = gets.chomp.to_i

current_year = Date.today.year
years_left = retirement_age - age
retirement_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"

def get_grade(g1, g2, g3)
  average = (g1 + g2 + g3) / 3.0
  return 'A+' if average > 100.0
  case average
  when 90.0...100.0 then 'A'
  when 80.0..90.0 then 'B'
  when 70.0..80.0 then 'C'
  when 60.0..70.0 then 'D'
  else 'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(110, 105, 103) == 'A+'

def swap_name(name)
  first, last = name.split
  "#{last}, #{first}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
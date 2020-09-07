def buy_fruit(list)
  result = []
  list.each do |fruit_info|
    fruit_info[1].times { result << fruit_info[0] }
  end
  result
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

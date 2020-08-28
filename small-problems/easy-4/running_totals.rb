def running_total(arr)
  curr_total = 0
  arr.map do |n|
    curr_total += n
    curr_total
  end
end

p running_total([2, 5, 13])
p running_total([14,11,7,15,20])
p running_total([3])
p running_total([])
def running_total(arr)
  curr_total = 0
  arr.map do |n|
    curr_total += n
    curr_total
  end
end

def running_total_ewo(arr)
  curr_total = 0
  arr.each_with_object([]) do |n, result|
    curr_total += n
    result << curr_total
  end
end

def running_total_inject(arr)
  result = []
  arr.inject(0) do |n, sum|
    result << (sum + n)
    sum + n
  end
  result
end

p running_total_inject([2, 5, 13])
p running_total_inject([14,11,7,15,20])
p running_total_inject([3])
p running_total_inject([])
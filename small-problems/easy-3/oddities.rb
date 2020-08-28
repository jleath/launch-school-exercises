def oddities(arr)
  result = []
  arr.each_with_index { |item, index| result << item if (index+1).odd? }
  result
end

def oddities2(arr)
  result = []
  counter = 0
  loop do
    break if counter >= arr.size

    result << arr[counter]
    counter += 2
  end
  result
end

def evenities(arr)
  result = []
  counter = 2
  loop do
    break if counter >= arr.size

    result << arr[counter]
    counter += 2
  end
  result
end

p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []

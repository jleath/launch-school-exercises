def extract_column(arr, x, y, length, reverse=false)
  result = []
  if reverse
    x_index = x + length - 1
    while x_index >= x
      result << arr[x_index][y]
      x_index -= 1
    end
  else
    x_index = x
    while x_index < x + length
      result << arr[x_index][y]
      x_index += 1
    end
  end
  result
end

def extract_row(arr, x, y, length, reverse=false)
  result = []
  if reverse
    y_index = y + length - 1
    while y_index >= y
      result << arr[x][y_index]
      y_index -= 1
    end
  else
    y_index = y
    while y_index < y + length
      result << arr[x][y_index]
      y_index += 1
    end
  end
  result
end

def get_ring(arr, x, y, n)
  result = extract_row(arr, x, y, n)
  result += extract_column(arr, x+1, y+n-1, n-1)
  result += extract_row(arr, x+n-1, y, n-1, true)
  result += extract_column(arr, x+1, y, n-2, true)
  result
end

def snail(arr)
  return [] if arr[0].empty?

  result = []
  n = arr.length
  start_x = 0
  start_y = 0
  while n > 0
    result += get_ring(arr, start_x, start_y, n)
    n -= 2
    start_x += 1
    start_y += 1
  end
  result
end

test = [[1,2,3],[4,5,6],[7,8,9]]
n = 3
x = 0
y = 0
test2 = [[1,2,3,1],[4,5,6,4],[7,8,9,7],[7,8,9,7]]

test3 =
[[1, 2, 3, 4, 1],
 [5, 6, 7, 8, 5],
 [9, 8, 7, 6, 5],
 [1, 2, 3, 4, 5],
 [5, 6, 7, 8, 9]]

p get_ring(test, 0, 0, 3)
p get_ring(test, 1, 1, 1)
p get_ring(test2, 0, 0, 4)
p get_ring(test2, 1, 1, 2)
# [1, 2, 3, 4, 1, 5, 5, 5, 9, 8, 7, 6, 5, 1, 9, 5]
# [6, 7, 8, 6, 4, 3, 2, 8]
# [7]
p get_ring(test3, 0, 0, 5)
p get_ring(test3, 1, 1, 3)
p get_ring(test3, 2, 2, 1)
p snail(test3))
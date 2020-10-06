=begin
input: an array representing a 3x3 matrix
output: a new array representing the transposition of the input matrix

may not mutate the original array
will assume that all inputs are a valid 3x3 matrix

A transposition of a 3x3 matrix involves swapping the rows and columns
So the first column becomes the first row, and so on.

will manually construct the array one element at a time, starting by
constructing the first row and then moving to the next.

Since we know we have a 3x3 matrix, this requires the following array access
sequence:
 - [0][0]
 - [1][0]
 - [2][0]
 - [0][1]
 - [1][1]
 - ...
 - [2][2]

SET col = 0
SET new_array = []
WHILE col < 3
  SET new_array[col] = [] 
  SET row = 0
  WHILE row < 3
    SET val = arr[row][col]
    SET new_array[col][row] = val
    SET row += 1
  SET col += 1
RETURN new_array

=end

def transpose(matrix)
  result = []
  (0...matrix[0].size).each do |col|
    new_row = (0...matrix.size).map { |row| matrix[row][col] }
    result << new_row
  end
  result
end

def transpose!(matrix)
  (0...matrix.size).each do |row|
    ((row+1)...matrix[0].size).map do |col|
      matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]] 
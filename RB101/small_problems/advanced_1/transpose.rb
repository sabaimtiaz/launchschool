def transpose(matrix)
  row = -1
  n = matrix.size
  new_matrix = [[],[],[]]
  n.times do
    row += 1
    new_matrix[0] << matrix[row][0]
    new_matrix[1] << matrix[row][1]
    new_matrix[2] << matrix[row][2]
  end
  new_matrix
end
matrix = [[1, 5, 8],
         [4, 7, 2], 
         [3, 9, 6]]
transpose(matrix)

# LS solution
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end
matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
transpose(matrix)

# advanced
def transpose(matrix)
  size = matrix.size
  size.times do |row|
    size.times do |col|
      matrix[row] << matrix[col].shift    
    end
  end
  matrix
end
matrix = [[2, 4, 5],
         [3, 2, 1],
         [1, 8, 9]]
transpose(matrix)

#  array[i] = subarr[0]
# end
# p array

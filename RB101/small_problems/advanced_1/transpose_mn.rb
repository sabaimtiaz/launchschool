matrix = [[1, 2, 3, 4, 5], 
          [4, 3, 2, 1, 0], 
          [3, 7, 8, 6, 2]]

# result = [1, 4, 3], [2, 3, 7]
  matrix.each.with_index do |col, i|
    matrix[i] = col[0]
  end
  p matrix


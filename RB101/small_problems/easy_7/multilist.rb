#arr1 = [3, 5, 7]
#arr2 = [9, 10, 11]
def multiply_list(arr1, arr2)
  multi_arr = []
  arr1.each.with_index do |num, idx|
    multi_arr << num * arr2[idx]
  end
  multi_arr
end
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# zip
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |total| total.inject(:*) }
end
p multiply_list([3, 5, 7], [9, 10, 11])
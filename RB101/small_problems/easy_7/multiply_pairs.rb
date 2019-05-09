def multiply_pairs(arr1, arr2)
  result = []
  for num in arr1
    for num2 in arr2
      result << num * num2
    end
  end
  result.sort! do |a, b|
    a <=> b
  end
  result # LS solution just uses result.sort 
end
p multiply_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
def merge(arr1, arr2)
  arr1 << arr2
  arr1.flatten!.uniq!
  arr1
end
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# LS solution
def merge(array_1, array_2)
  array_1 | array_2
end
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
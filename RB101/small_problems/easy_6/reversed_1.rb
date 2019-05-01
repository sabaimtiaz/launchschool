def reverse(array)
 array.sort! do |a, b|
  array.index(b) <=> array.index(a)
  end
end
list = [1, 2, 3, 4]
list = %w(a b e d c)
list = ['abc']
p reverse(list)
p reverse(list).object_id
p list.object_id

# LS solution
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  p array
end
reverse!([1, 2, 3, 4, 5])
test_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
def joinor(array)
  if array.empty?
    array
  elsif array.size == 1
    array[0]
  elsif array.size == 2
    "#{array[0]} or #{array[1]}"
  elsif array.size >= 3
    array_remaining = array[0..-2].join(', ')
    "#{array_remaining}, or #{array[-1]}"
  end
end
puts joinor(test_arr)
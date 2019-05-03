# takes array as argument
# returns 2 arrays as a pair of nested arrays
# that contain the first and second half of the array
# if orig array had odd # of elements the middle number should be in the first of the two nested arrays

def halvsies(arr)
  if arr.size.even?
    arr.partition.with_index {|element, index| index < arr.size/2}
  elsif arr.size.odd?
    arr.partition.with_index {|element, index| index < (arr.size/2)+1}
  end
end
p halvsies([1, 5, 2, 4, 4, 5])
p halvsies([1, 5, 2, 4, 4, 5, 3, 2, 3, 1, 2, 2, 2])
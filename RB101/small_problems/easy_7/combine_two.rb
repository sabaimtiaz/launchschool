a = [1, 2, 3]
b = ['a', 'b', 'c']
arr = []
loop do
  arr << a.shift 
  arr << b.shift
  break if a.empty? && b.empty?
end

def interleave(arr1, arr2)
  arr = []
  loop do
    arr << arr1.shift
    arr << arr2.shift
    break if arr1.empty? && arr2.empty?
  end
  arr
end
p interleave([1, 2, 3], ['a', 'b', 'c'])

# LS solution
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
p interleave([1, 2, 3], ['a', 'b', 'c'])
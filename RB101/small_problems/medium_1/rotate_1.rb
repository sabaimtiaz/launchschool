# destructive
# arr = [5, 4, 3, 2]
# arr.insert(arr.size, arr[0])
# arr.shift
# p arr

# non destructive
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]      

def rotate_string(str)
  p (str.chars[1..-1] + [str.chars[0]]).join('')
end
p rotate_string("The coffee boils")

def rotate_int(int)
  p rotate_array(int.digits.reverse).join('').to_i
end
rotate_int(55421)
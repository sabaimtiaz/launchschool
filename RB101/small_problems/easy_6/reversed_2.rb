
# LS solution
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element}
  p result_array
  p array.object_id != result_array.object_id
end
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true
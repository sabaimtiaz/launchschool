# side effect: displays something to the output
# returns: nil

def total(num1, num2)
  puts num1 + num2
end

total(5, 6)

# side effect: mutates the passed-in array
# returns - updated array

def append(target_array, value_to_append)
  target_array << value_to_append
  p target_array
end

append([4, 6], 4)

# side effect: none
# returns: new integer
def total(num1, num2)
  num1 + num2
end
total(6, 4)
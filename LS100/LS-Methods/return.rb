def add_three(number)
  return number + 3
  number + 4 #when you do this it has no bearing - it will return the evaluated result w/o executing the next line
end

returned_value = add_three(4)
puts returned_value
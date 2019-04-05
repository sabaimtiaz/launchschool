def multiply(numbers, trans_criteria)
  multi_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    multi_numbers << current_number *=trans_criteria
    counter +=1  
  end
  p multi_numbers
end
my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3)
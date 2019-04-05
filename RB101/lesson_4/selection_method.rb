def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2
    counter += 1
  end

  p doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers)
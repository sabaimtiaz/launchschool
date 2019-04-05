def double_numbers!(numbers)
  counter = 0

  loop do 
    break if counter == numbers.size
    numbers[counter] *=2
    counter += 1
  end

  p numbers

end
my_numbers = [1, 4, 5, 7, 2]
double_numbers!(my_numbers)

def double_odd_index(numbers)
  doubled_indices = []
  counter = 0
  doubled_indices << numbers.map.with_index { |e, i| e*2 if i.odd? }
  p doubled_indices
end
double_odd_index([1, 2, 3, 4, 5])

def double_odd_index(numbers)
  doubled_indices = []
  counter = 0

  loop do
    current_number = numbers[counter]
    doubled_indices << current_number *= 2 if counter.odd?
    counter += 1
    break if counter == numbers.size
  end

  p doubled_indices
end
my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_index(my_numbers)
numbers = [5, 2, 9, 6, 3, 1, 8]
even_numbers = numbers.select do |n|
  n.even? 
end

p even_numbers
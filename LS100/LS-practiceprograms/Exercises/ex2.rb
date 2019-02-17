arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each do |number|
  if number > 5 
    puts number
  end
end
new_array = arr.select do |number|
  number.odd?
end

p new_array
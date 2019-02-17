arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

neW_array = arr.select do |number|
  number.odd?
end

p neW_array
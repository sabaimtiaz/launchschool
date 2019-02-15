a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b = a.select do |number|
  number.odd?
end
p b



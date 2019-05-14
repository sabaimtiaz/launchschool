def buy_fruit(list)
  list.map { |subarr| [subarr[0]] * subarr[1] }.flatten
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

def count_occurences(arr)
  occurences = {}

  arr.each do |element|
   occurences[element] = arr.count(element)
 # puts occurences[element]
  end

  occurences.each do|element, count|
   puts "#{element} => #{count}"
   
  end
   
end

count_occurences(['car', 'car', 'truck', 'car', 'SUV', 'truck',
 'motorcycle', 'motorcycle', 'car', 'truck'])
count_occurences(['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 'MOTORCYCLE'])
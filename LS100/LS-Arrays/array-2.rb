a = [1, 2, 3, 4, 5]
b = a.map {|num| num **2}
c = a.collect{|num| num*3}

puts b
puts c

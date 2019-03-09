#arr = %w(1 0)
#arr_size = arr.size / 2
#new_arr = arr * arr_size
#p new_arr.to_s()
#num = 4
#num.times do
#arr_1 = ["1"]
#arr_2 = ["0"]
#num.times do
 #p arr_1.each.with_index { |arr_1, i| i * 1} 
 #p arr_2.each.with_index { |arr_2 , i| i *1}
 #end
  
#arr.each do 
#  puts arr 
#end
#end

#end
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    if size.odd?
    number = index.even? ? 0: 1
  end
    p number
 #   numbers << number
  end

 puts numbers.join
end
stringy(10)
stringy(6)
stringy(0)
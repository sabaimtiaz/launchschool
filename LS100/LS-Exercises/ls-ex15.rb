arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.each do | word |
 arr.delete_if  { |word| word.to_s.start_with?("s", "w")}
puts arr
end

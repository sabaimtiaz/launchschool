arr = ['snow', 'winter', 'ice', 'slippery']
arr.delete_if { |word| word.start_with?("s", "w")}
puts arr

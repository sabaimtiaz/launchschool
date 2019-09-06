
def format(array)
  string = ''
  array.each do |element|
    string << "#{element[0]} of #{element[1]}, "
   # string.delete_suffix(", ")
  end
  string.slice(0..-3)
  string.gsub(',', " \n").slice(0..-3)
 # string.each_line() {|s| p s}

end
arr = [[1, "clubs"],[2, "diamonds"],[3, "hearts"], [4, "clubs"], [5, "gifts"]]
puts format(arr)


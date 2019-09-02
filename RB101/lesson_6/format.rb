
def format(array)
  string = ''
  array.each do |element|
    string << "#{element[0]} of #{element[1]}, "
   # string.delete_suffix(", ")
  end
  string.slice(0..-3)
#  p string.delete_suffix(",")

end
arr = [[1, "clubs"],[2, "diamonds"],[3, "hearts"]]
p format(arr)

#   hand.each do |element|
#     string << "#{element[1]}, "
#   end
#   string.slice(0..-3)
# end
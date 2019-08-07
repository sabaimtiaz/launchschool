
def format(array)
  string = ''
  array.each do |element|
    string << "#{element[0]}, "
   # string.delete_suffix(", ")
  end
  p string.delete_suffix(",")
end
arr = [[1, "clubs"],[2, "diamonds"],[3, "hearts"], [4]]
format(arr)
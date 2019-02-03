arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)
puts arr

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)
puts arr
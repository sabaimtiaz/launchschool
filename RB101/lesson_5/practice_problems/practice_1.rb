arr = ['10', '11', '9', '7', '8']
arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# increasing order
arr.sort do |a, b|
  a.to_i <=> b.to_i
end
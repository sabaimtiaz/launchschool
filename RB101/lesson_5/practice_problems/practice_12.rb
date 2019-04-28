hsh = {}
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
arr.each do |item|
  hsh[item[0]] = item[1]
end
p hsh


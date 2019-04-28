array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
array.map! do |hash|
new_hash = {}
  hash.each do |keys, values|
    new_hash[keys] = values + 1
  end
  new_hash
end

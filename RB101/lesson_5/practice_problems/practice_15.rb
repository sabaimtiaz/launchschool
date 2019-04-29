arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.map do |hsh|
  hsh.each do |keys, values|
    values.map do |num|
      num.even?
    end
  end
end

puts arr

# LS solution

arr.select do |hsh|
  hsh.all? do |_, values|
    values.all? do |num|
      num.even?
    end
  end
end
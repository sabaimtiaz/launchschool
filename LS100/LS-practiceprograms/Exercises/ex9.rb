h = {a:1, b:2, c:3, d:4}
puts h[:b]
h[:e] = 5
puts h
h.delete_if do |key, value| 
  value < 3.5
end
puts h


family = {  uncles: ["bob", "joe", "steve"], sisters: ["jane", "jill", "beth"], brothers: ["frank","rob","david"] }
#new_family = family.select do |k,v|
 # k == :sisters || k == :brothers
#end
#arr = new_family.values.flatten
#p arr

immediate = family.select {|k,v| k == :sisters || k == :brothers }
p immediate.values.to_a.flatten



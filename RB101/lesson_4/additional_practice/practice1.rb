flintstones_hash = Hash.new
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.each_with_index { |e, i| flintstones_hash[e] = i}
p flintstones_hash


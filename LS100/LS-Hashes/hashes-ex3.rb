b99 = { detectives: ["Jake", "Amy", "Boyle", "Diaz"], leadership: ["Holt", "Terry", "Wuntch"], staff: ["Gina"] }
related = { couples: ["Jake", "Amy"], stepsiblings: ["Boyle", "Gina"]}
#puts b99.keys
#puts b99.values
b99.each_key { |key| puts key}
b99.each_value { |value| puts value}
b99.each { |key, value| puts "The #{key} comprise(s) of #{value}"}
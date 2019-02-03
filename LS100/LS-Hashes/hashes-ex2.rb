b99 = { detectives: ["Jake", "Amy", "Boyle", "Diaz"], leadership: ["Holt", "Terry", "Wuntch"], staff: ["Gina"] }
related = { couples: ["Jake", "Amy"], stepsiblings: ["Boyle", "Gina"]}
puts b99.merge(related)
puts b99
puts b99.merge!(related)
puts b99
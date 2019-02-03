b99 = {detectives: "Jake", sargeants: "Amy"}
puts b99.has_key?("detectives")
puts b99.has_value?("Amy")
puts b99.select{ |k,v| v == "Jake"}
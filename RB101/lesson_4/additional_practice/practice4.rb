ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_values = []
ages.select {|_, v| age_values << v}
puts age_values.min

# ages.values.min

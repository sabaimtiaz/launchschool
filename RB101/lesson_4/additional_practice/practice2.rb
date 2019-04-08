ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_values = []
ages.select {|k,v| ages_values << v}
p ages_values.sum


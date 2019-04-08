ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if {|k, v| v > 100}
puts ages

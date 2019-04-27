munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# p munsters.values[0]["age"] 
total_men_ages = 0
munsters.each_value do |value|
  total_men_ages += value["age"] if value["gender"] == "male"  
end
p total_men_ages
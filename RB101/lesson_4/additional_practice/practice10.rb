munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


#problem 
# add age group to munsters by using the data provided to generate a group
# explanation
# modify hash to add age group key-pairs
# use values in hash to determine age group
# data 
# a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+
# algo
# conditional statements
# problem suggests using case and range

munsters.each do |name, info|
  case info["age"]
  when 0...18
   info["age_group"] = "child"
 when 18...65
  info["age_group"] = "adult"
else
  info["age_group"] = "senior"
  end
end
puts munsters

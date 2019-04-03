#Q 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.has_key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")

# Q2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!


# Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge(additional_ages)

# Q4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("dino")
p advice.match?("dino")

# Q5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

# Q6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino")
p flintstones.push("Dino").push("Hoppy")

# Q8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..37)
advice.slice!(0, advice.index('house'))

# Q9
statement = "The Flintstones Rock!"
p statement.count('t')

# Q10
title = "Flintstone Family Members"
p title.center(40)


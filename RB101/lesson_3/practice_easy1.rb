# Q1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# The code should print out 1, 2, 2, 3 because numbers.uniq is not a destructive method

# Q2
# 1 !=
# not equal to. can be in a conditional
# 2 !user_name - to turn an object into boolean
# 3 words.uniq! - destructive, part of syntax
# 4 ? before something - ternary operator if/else
# 5 ? - ruby syntax
# 6 - !!user_name - opposite of boolean equiv (falsey?)

#Q3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
p advice

# Q4
numbers = [1, 2, 3, 4, 5]

p numbers.delete_at(1)
# This will delete the numbers at the index value 1 of the array
p numbers.delete(1)
# this will delete 1 from the array

#Q 5

# Programmatically determine if 42 lies between 10 and 100.
p 42.between?(10, 100)
p (10..100).include?(42)
p (10..100).cover?(42)

#Q 6
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
"Four score and" + " " + famous_words

#Q 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)

# Q8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten!

#Q 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.to_a[2]
p flintstones.assoc("Barney")
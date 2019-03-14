# gets 6 numbers from the user
# prints a message to descrie if 6 number is among 5
# test
# a = [1, 2, 3, 4]
# if a.include?(3)
# puts "The array includes 3"
# end
# push the input into an array and use last and include
# code
array = []
counter = 0
6.times do
  puts "Please enter number #{counter += 1}"
  answer = gets.chomp
  array.push(answer)
end

puts "You entered #{array}"

num = array.last

if array[0..4].include?(num)
  puts "The sixth number already exists in the array."
else
  puts "The sixth number did not exist in the array."
end

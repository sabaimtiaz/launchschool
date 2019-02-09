
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
loop do
  puts "Please enter the numerator"
  numerator = gets.chomp
  
  break if valid_number?(numerator)
  puts "Incorrect."
end

denominator = nil
loop do
  puts "Please enter the denominator"
  denominator = gets.chomp

if denominator == '0'
  puts "Incorrect, can't put zero"
else
  break if valid_number?(denominator)
  puts "Invalid input"
end
end

result = numerator.to_i / denominator.to_i
puts "#{numerator} / #{denominator} is #{result}"



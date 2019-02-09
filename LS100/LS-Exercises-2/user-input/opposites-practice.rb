
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def read_number
  loop do
    puts "Please enter a positive or negative number"
    number = gets.chomp
    return number.to_i if valid_number?(number) #passing number to valid number method
    #use return to get the number as an integer 
    puts "Invalid input. Only non-zero integers are allowed"
  end
end 

#to verify a number is greater / less than zero

num_one = nil
num_two = nil

loop do
  num_one = read_number
  num_two = read_number
  break if num_one * num_two < 0
  puts "Sorry, you must have one positive and one negative integer"
  puts "Please start over"
  
end

sum = num_one + num_two
puts "#{num_one} + #{num_two} is #{num_one + num_two}"

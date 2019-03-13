NUM = 1

def sum(given)
  sum = (NUM..given).reduce(:+)
  puts "The sum of the integers between 1 and #{given} is #{sum}"
end

def product(given)
  product = (NUM..given).reduce(:*)
  puts "The product of the integers between 1 and #{given} is #{product}"
end

loop do
  puts 'Please enter an integer greater than 0'
  given = gets.chomp.to_i
  if given < 0
    puts "Wrong number"
    next
  end

  puts "Enter 's' to compute the sum, 'p' to compute the product."
  answer = gets.chomp
  if answer == 's'
    sum(given)
  elsif answer == 'p'
    product(given)
  else
    puts "Unknown operation."
  end

  puts 'Press y to continue, any other key to exit'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
puts 'Thank you. Good bye.'

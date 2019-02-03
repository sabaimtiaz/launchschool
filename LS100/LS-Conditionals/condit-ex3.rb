puts "Enter a number between 0 and 100"
  num = gets.chomp.to_i
  puts "you entered #{num}"
  if (num >= 0 && num <= 51)
    puts "the number #{num} is between 0 and 50"
  elsif (num >= 51 && num <=100)
    puts "the number #{num} is between 51 and 100"
  elsif (num > 100)
    puts "#{num} is more than 100"
  end


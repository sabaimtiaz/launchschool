loop do
  number = nil
  answer = nil
  loop do 
    puts "How many lines do you want. Enter a number that is at least 3 or press q to quit"
    number = gets.chomp.to_i
    break if number >= 3
    number = answer.to_s.downcase
    break if answer == 'q' || answer == 'Q'
    puts "Bye bye" 
  end
  break if answer == 'q' || answer == 'Q'

  while number > 0
    puts "Launch School is the best!"
    number -=1 
    end
  end

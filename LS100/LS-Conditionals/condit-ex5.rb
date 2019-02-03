def calculate(answer)
  case 
  when answer <= 51
    puts "the number #{answer} is between 0 and 50"
  when answer <=100
    puts "the number #{answer} is between 51 and 100"
  else answer > 100
   puts "#{answer} is more than 100"
  end
end

puts "Enter a number between 0 and 100"
answer = gets.chomp.to_i

calculate(answer)
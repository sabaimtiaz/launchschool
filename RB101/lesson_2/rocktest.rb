choices = Hash.new
rock = {"scissors" =>  "rock beats scissors"}
#{ "paper" => , "scissors" =>, "lizard" => , "Spock" =>}
#rules = {""}


#puts choices["paper"]
#puts choices.keys
puts "The choices are rock or paper"
answer = gets.chomp
puts choices.select { |k,v| k == "#{answer}"} 




#if choices.has_key?("#{answer}")
 #puts  
#else
 #puts "try again"
#end



  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'Spock' && second == 'paper') ||
    (first == 'lizard' && second === 'paper') ||
    (first == 'rock' && second == 'lizard') 
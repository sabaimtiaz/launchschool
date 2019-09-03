
moves = {"h"=>"hit", "hit"=>"hit", "s"=>"stay", "stay"=>"stay"}
answer = gets.chomp
if moves.include?(answer)
  p "hello"
end

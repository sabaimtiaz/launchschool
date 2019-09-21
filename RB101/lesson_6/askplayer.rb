
  MOVES = [["h", "hit"],["s", "stay"]]
def ask_player
  puts "---------------------"
  puts "Player, hit or stay?"
  player_answer = gets.chomp
  p player_answer.to_s
  p MOVES.flatten.include?(player_answer)
  unless MOVES.flatten.include?(player_answer)
   puts "error!"
  end
  #error_msg(player_answer)
end

ask_player
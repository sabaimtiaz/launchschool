

def alternate_player(current_player)
  if current_player == "Player"
    current_player = "Computer"
  elsif current_player == "Computer"
    current_player = "Player"
  end
end
p alternate_player("Computer")

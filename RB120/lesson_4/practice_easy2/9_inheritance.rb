class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
	def play
		"Let the games begin!"
	end

  def rules_of_play
    #rules of play
  end
end
game = Bingo.new
p game.play # when the #play method is called, it looks for the play method in Bingo first
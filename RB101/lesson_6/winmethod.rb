# def player_win?(p_cards, d_cards)
#   busted?(d_cards) ||
#     !busted?(p_cards) && (dealer_reach_max?(d_cards) &&
#   (hand_total(p_cards) > hand_total(d_cards)))
# end



# score = 0
# def win(cards, score)
#   input = gets.chomp.to_i
#   if cards.include?(input)
#     score += 1
#   end
#   score
# end
# p win([5, 3, 2], score)


winner = ''
def wins(cards, winner)
  input = gets.chomp.to_i
  if cards.include?(input)
    winner = "player"
  else
    winner = "computer"
  end
end
p wins([5, 3, 2], winner) == "player"

score = 0
cards = [5, 3, 2]
def scoring(cards, winner, score)
  if wins(cards, winner) == "player" 
    score += 1
  end
end
p scoring(cards, winner, score)
player_score = scoring(cards, winner, score)
p player_score
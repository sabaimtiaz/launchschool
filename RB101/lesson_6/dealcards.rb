DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "king", "queen", "ace"]
SUITS = %w[hearts diamonds clubs spades]
def generate(cards)
  cards = []
    cards << DECK.sample(1) + SUITS.sample(1)
    cards << DECK.sample(1) + SUITS.sample(1)
end
dealer_cards = []
player_cards = []
p generate(dealer_cards)
p generate(player_cards)
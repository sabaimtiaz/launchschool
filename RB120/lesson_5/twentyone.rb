class Card
	SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
	VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace']
end

class Deck 
 	attr_accessor :cards
	def initialize
		@cards = Card::VALUES.product(Card::SUITS).shuffle
	end

	def deal_one_card
		cards.pop
	end
end

module Hand
	def add_card(new_card)
		cards << new_card
	end

	def total
		total = 0
		values = cards.map { |card| card[0] }
		values.each do |card|
			if card == "Ace"
				total += 11
			elsif card.to_i == 0
				total += 10
			else
				total += card
			end
		end
		return total
	end

	def busted?
		total > 21
	end

	def show_hand
		str = ''
		cards.each {|card| str << "#{card[0]} of #{card[1]}, "}
		p str.slice.
	end

end

class Player 
	include Hand
	attr_accessor :cards, :name
	
	def initialize
		@cards = []
		@name = name
	end

	def enter_name
    player_name = ''
    loop do
      puts "Enter your name:"
      player_name = gets.chomp
      break if player_name.scan(/[^a-zA-Z]/).empty?
      puts "Sorry, no numbers or characters allowed!"
    end
    @name = player_name
  end
end

class Dealer
	include Hand
	attr_accessor :cards

	def initialize
		@cards = []
	end
end

class Game
	attr_accessor :deck, :human, :dealer
	def initialize
		@deck = Deck.new
		@human = Player.new
		@dealer = Dealer.new
	end

	def start
		display_welcome_message
		human.enter_name
		deal_cards
		show_initial_cards
		player_turn
		dealer_turn
		display_busted_message
		show_result
	end

	def deal_cards
		2.times do
			human.add_card(deck.deal_one_card)
			dealer.add_card(deck.deal_one_card)
		end
	end

	def show_initial_cards
		puts "#{human.name} has:"
		human.show_hand
	
		puts "Dealer has:"
		dealer.show_hand
	end

	def player_turn
		loop do
			puts "Would you like to (h)it or (s)tay?"
			answer = nil
			loop do
				answer = gets.chomp.downcase
				break if ['h', 's'].include?(answer)
				puts "Sorry, must enter 'h' or 's'!"
			end

			if answer == "s"
				puts "#{human.name} stays!"
				break
			elsif human.busted?
				break
			else
				human.add_card(deck.deal_one_card)
				puts "#{human.name} hits!"
				human.show_hand
				break if human.busted?
			end
		end
	end

	def dealer_turn
		loop do
			if dealer.total >= 17 && !dealer.busted?
				puts "Dealer stays!"
				break
			elsif dealer.busted?
				break
			else
				puts "Dealer hits!"
				dealer.show_hand
				dealer.add_card(deck.deal_one_card)
			end
		end
	end


	def show_result
		puts "#{human.name} has:"
		human.show_hand
	end

	private

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def display_busted_message
		if human.busted?
			puts "#{human.name} busted!"
		elsif dealer.busted?
			puts "Dealer busted!"
		end
	end

end

Game.new.start
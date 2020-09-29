class Deck
  attr_accessor :cards

  SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'King', 'Queen', 'Ace']

  def initialize
    @cards = VALUES.product(SUITS).shuffle
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
      total += if card == "Ace"
                 11
               elsif card.to_i == 0
                 10
               else
                 card
               end
    end
    values.select { |_| "Ace" }.count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def busted?
    total > 21
  end

  def show_hand
    str = ''
    cards.each { |card| str << "#{card[0]} of #{card[1]}, " }
    str.slice(0..-3)
  end

  def show_one_card
    str = cards[0].map { |card| card }.join(" of ")
    str
  end
end

class Participant
  include Hand
  attr_accessor :cards, :name

  def initialize
    @cards = []
    @name = name
  end
end

class Game
  attr_accessor :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Participant.new
    @dealer = Participant.new
  end

  def enter_name
    player_name = ''
    loop do
      puts "Enter your name:"
      player_name = gets.chomp
      break if player_name.scan(/[^a-zA-Z]/).empty?
      puts "Sorry, no numbers or characters allowed!"
    end
    human.name = player_name
  end

  def start
    display_welcome_message
    enter_name
    clear
    display_distro_message
    main_game
    display_goodbye_message
  end

  private

  def setup_game
    deal_cards
    show_initial_cards
  end

  def main_game
    loop do
      setup_game
      player_turn
      dealer_turn
      display_busted_message
      show_result
      break unless play_again?
      display_play_again_message
      reset_game
    end
  end

  def deal_cards
    2.times do
      human.add_card(deck.deal_one_card)
      dealer.add_card(deck.deal_one_card)
    end
  end

  def show_initial_cards
    puts "#{human.name}'s cards: #{human.show_hand}"
    puts ""
    puts "Dealer's card: #{dealer.show_one_card}"
  end

  def hit_or_stay
    puts " "
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'!"
    end
    answer
  end

  def player_turn
    loop do
      answer = hit_or_stay
      if answer == "s"
        puts "#{human.name} stays!"
        break
      elsif human.busted?
        break
      else
        human.add_card(deck.deal_one_card)
        puts "#{human.name} hits! #{human.name} has #{human.show_hand}."
        puts "The total is #{human.total}."
        break if human.busted?
      end
    end
  end

  def dealer_turn
    puts "Dealer's turn..."
    loop do
      Kernel.sleep(1)
      if dealer.total >= 17 && !dealer.busted?
        puts "Dealer stays!"
        break
      elsif dealer.busted?
        break
      else
        clear
        puts "Dealer hits! Dealer had #{dealer.show_one_card}."
        dealer.add_card(deck.deal_one_card)
      end
    end
  end

  def show_result
    show_winner
    determine_winner
    show_final_cards
  end

  def determine_winner
    if human.total > dealer.total
      puts "#{human.name} wins!"
    elsif human.total < dealer.total
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def show_final_cards
    puts "#{human.name} had: #{human.show_hand}"
    puts "The total value of the cards was #{human.total}"
    puts "----------------------------------------------------"
    puts "Dealer had: #{dealer.show_hand}"
    puts "The total value of Dealer's cards was #{dealer.total}"
  end

  def play_again?
    answer = nil
    loop do
      puts " "
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset_game
    self.deck = Deck.new
    human.cards = []
    dealer.cards = []
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def display_distro_message
    puts "Distributing cards..."
    puts ""
    Kernel.sleep(1)
    clear
  end

  def display_busted_message
    puts " "
    if human.busted?
      puts "#{human.name} busted!"
      puts "----------------------"
    elsif dealer.busted?
      puts "Dealer busted!"
      puts "----------------------"
    end
  end

  def show_winner
    puts "The result is..."
    puts ""
  end

  def display_play_again_message
    puts "Let's play again!"
    puts " "
    Kernel.sleep(1)
    clear
  end

  def display_goodbye_message
    clear
    puts "Thanks for playing Twenty-One! Goodbye!"
  end

  def clear
    system 'clear'
  end
end

Game.new.start

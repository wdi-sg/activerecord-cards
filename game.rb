class Game
  attr_accessor :hands, :current_hand

  def initialize
    @deck = Cards.new
    @score = 0
    @current_hand = []
    @hands = []
  end

  def play
    @current_hand = []
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    @current_hand.push(user_hand)
    @current_hand.push(house_hand)
    @hands << @current_hand

    if user_hand > house_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end

end

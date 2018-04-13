class Game
  attr_accessor :username, :round
  def initialize(username)
    @deck = Cards.new
    @score = 0
    @hands = []
    @username=username
    @round = 0
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    @hands << [user_hand, house_hand]

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

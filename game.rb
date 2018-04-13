require './models/hand.rb'

class Game
  attr_reader :user
  def initialize(user)
    @deck = Cards.new
    @score = 0
    @hands = []
    @user = user
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    @hands << [user_hand, house_hand]
    Hand.create(user_hand: user_hand, house_hand: house_hand, player: @user)
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

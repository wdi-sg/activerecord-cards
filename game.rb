require './game'
require './cards'

class Game

  def initialize
    @deck = Cards.new
    @score = 0
    @hands = []
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    find_user = User.last
    Hand.create(users_id: find_user.id)

    @hands << [user_hand, house_hand]

    user_turn = Hand.last

    if user_hand > house_hand
      user_turn.update(card: "Won")
      @score += 1
    else
      user_turn.update(card: "Lost")
      @score -= 1
    end
  end

  def check_game
    @score
  end

end

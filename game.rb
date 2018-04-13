class Game

  def initialize
    @deck = Cards.new
    @score = 0
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card

    Hand.create(user_name: User.last.name, user_hand: user_hand, house_hand: house_hand)
    
    if user_hand > house_hand
      @score += 1
    else
      @score -= 1
    end
  end

  def check_game
    @score
  end

  def statement
    Hands.all.each do |hand, index|
      puts "Round #{index+1}: #{hand.user_name} drew #{hand.user_hand} and house drew #{house.house_hand}."
    end
  end

  def end_game
    Hand.destroy_all
  end

end

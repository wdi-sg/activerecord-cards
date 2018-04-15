class Game

  attr_accessor :name

  def initialize (username)
    @name = username
    @deck = Cards.new
    @score = 0
    @hands = []
    puts "inside game and initialize" + @name
  
  end

  def play
    user_hand = @deck.show_card
    house_hand = @deck.show_card
    @hands << [user_hand, house_hand]

    Hand.create(user_hand: user_hand, house_hand: house_hand, username: @name)


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

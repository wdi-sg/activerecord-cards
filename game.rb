class Game
  
  attr_accessor :user
  
  def initialize (user)
    @deck = Cards.new.shuffle
    @user = user
    @session_no = 0
    @score = 0
    @hands = []
  end

  def session
    session = Hand.last
    @session_no = session.session_no.to_i
    @session_no +=1
  end

  def current_session
    session = Hand.last
    @session_no = session.session_no.to_i   
  end

  def deal_card
    @deck.shift
  end

  def play

    user_hand = deal_card
    house_hand = deal_card
    
    puts "\n#{@user} has #{user_hand}"
    puts "Dealer has #{house_hand}"
    
    @hands << [user_hand, house_hand]
    
    Hand.create(session_no: @session_no, username: @user, user_hand: user_hand, house_hand: house_hand)
    
    if user_hand > house_hand
      @score += 1
      puts "\n#{@user} wins 1 point."
    else
      @score -= 1
      puts "\n#{@user} loses 1 point."
    end
  end
  
  def check_game
    @score
  end

  def cards_left
    @deck.length
  end
  
  def reshuffle
    @deck = Cards.new.shuffle
  end
  
end

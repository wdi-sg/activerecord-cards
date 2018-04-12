class Game
  attr_accessor :score, :turn, :currentDeck, :computerHand, :playerHand

  def initialize
    @computerHand = []
    @playerHand = []
    @score = 0
    @turn = 0
    @currentDeck = []
  end

  def drawCards
    @turn += 1
    puts ""
    puts "Round #{turn}"
    puts("shuffling deck")
    currentDeck.shuffle!
    puts("draw two cards from deck")
    @computerHand.push(currentDeck[0])    
    puts "computer has #{@computerHand[turn-1]}"
    @playerHand.push(currentDeck[1])
    puts "player has #{@playerHand[turn-1]}"
  end

  def compare(username)
    # puts "Hello " + username + " you have #{score} points"
    bet = 1
    # puts "do you want to wager points[Y/N]"
    # choice = gets.chomp
    # if(choice == "Y")
    #   puts "how much?"
    #   bet = gets.chomp
    # end

    #if player has highest card, increment score
    if(@playerHand[turn-1] > @computerHand[turn-1])
      @score += bet.to_i.abs
      puts "score added"
    #if computer has highest card, deduct score
    elsif(@playerHand[turn-1] < @computerHand[turn-1])
      @score -= bet.to_i.abs
      puts "score deducted"
    end
    puts "Current score: #{score}"
  end

end

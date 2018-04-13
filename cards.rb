class Cards
  attr_accessor :cards

  def initialize
    #initialize cards to be an array with 52 elements
    @cards = (1..52).to_a
  end

  #remove the two cards that are picked from the deck
  def removeCards
    @cards.slice!(0,2)
  end
end

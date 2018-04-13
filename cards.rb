class Cards
  def initialize
    @cards = []
    52.times do |number|
      @cards << (number + 1)
    end
  end

  def shuffle
    @cards.shuffle
  end

  # def get_card
  #   @cards.shuffle.pop
  # end
end

require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "byebug"

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file
require_relative "models/user"

require './game'
require './cards'

def Gamestart()
  puts "What is your name?"
  user_name = gets.chomp
  puts "Hello #{user_name}"

  newGame = Game.new
  newCards = Cards.new
  running = true

  player = User.create(name: user_name)

  while(running)
    newGame.currentDeck = newCards.cards
    break if (newGame.currentDeck == [])  
    newGame.drawCards
    newCards.removeCards

    Hand.find_or_create_by(user_hand: newGame.playerHand[newGame.turn-1], house_hand: newGame.computerHand[newGame.turn-1],user_id: player.id)

    newGame.compare(user_name)
    break if (newGame.score < -2) 
    puts "do you want to continue playing [Y/N]"
    answer = gets.chomp
    if answer == "N"
      puts "you folded the game with a score of #{newGame.score}"
      running = false
    end
  end
  puts "Game ended. Printing all hands in this session"
  output = Hand.where(user_id: player.id)
  output.each { |val| pp val }
end

Gamestart()

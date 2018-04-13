require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file
require_relative "models/user"

require './game'
require './cards'

playing = true

# creates a new instance of a game from  Game class (from game.rb)
game = Game.new

# Destroy both User and Hand
User.destroy_all
Hand.destroy_all

# Create 2 new users - user & house
user = User.create(name: "user")
house = User.create(name: "house")

while playing

  # calls play method from game
  game.play
  puts "\ncurrent score is: #{game.check_game.to_s}"
  puts "User has played a hand of value => #{game.current_hand[0]}"
  puts "House has played a hand of value => #{game.current_hand[1]}"

  # Store the cards played by the user into the database
  Hand.create(played_hand: game.current_hand[0], user: user)

  # Store the cards played by the house into the database
  Hand.create(played_hand: game.current_hand[1], user: house)

  #end game condition
  if game.check_game < -2
    playing = false
    user = User.find_by(name: "user")
    house = User.find_by(name: "house")
    # pry
    puts "All the hands that have been played in this session => #{game.hands}"
    break
  end

  #stop or contiune game
  puts "do you want to play this hand?"
  answer = gets.chomp
  if answer == "no"
    puts "folding"
    playing = false
    user = User.find_by(name: "user")
    house = User.find_by(name: "house")
    # pry
    puts "All the hands that have been played in this session => #{game.hands}"
    break
  end
end

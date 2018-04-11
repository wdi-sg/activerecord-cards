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

puts "What is your name?"
user_name = gets.chomp
# creates a new entry in users TABLE
current_user = User.create(user_name: "#{user_name}")

while playing

  # calls play method from game
  game.play

  # creates a new entry in hands TABLE
  Hand.create(user_hand: "#{game.hands[0]}", house_hand: "#{game.hands[1]}", user_id: "#{current_user.id}")
  puts "current score is: #{game.check_game.to_s}"

  #stop or contiune game
  puts "do you want to play this hand?"
  answer = gets.chomp
  if answer == "no"
    puts "folding"
    playing = false
  end

  #end game condition
  if game.check_game < -2
    playing = false
  end

end
find_user= User.find_by(user_name: "#{user_name}")
pp find_user.hands

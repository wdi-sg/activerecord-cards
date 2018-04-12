require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file

require './game'
require './cards'

playing = true
# creates a new instance of a game from  Game class (from game.rb)
puts "Enter your name: "
user = gets.chomp
game = Game.new(user)
while playing
  # calls play method from game
  game.play
  puts "current score is: #{game.check_game.to_s}"

  #stop or contiune game
  puts "do you want to play this hand?"
  answer = gets.chomp
  if answer == "no"
    puts "folding"
    playing = false
    hands_played = Hand.where(player: user)
    hands_played.each do |hand|
      puts "user: " + hand.user_hand.to_s  
      puts "house: " + hand.house_hand.to_s
    end
  end

  #end game condition
  if game.check_game < -2
    playing = false
    puts Hand.where(player: user)
  end

end

require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file
require_relative "models/user"
require './game'
require './cards'

# creates a new instance of a game from  Game class (from game.rb)

puts "Enter your name:"
username = gets.chomp

game = Game.new(username)

user = User.create(name: username)

playing = true

while playing

  # calls play method from game
  game.play
  puts "current score is: #{game.check_game.to_s}"

  #stop or contiune game
  puts "do you want to play this hand? Type in no to fold. Otherwise, type any key"
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

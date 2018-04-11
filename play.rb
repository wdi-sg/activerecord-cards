require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file

require './game'
require './cards'

playing = true

game = Game.new

puts "What is your name?"
user_name = gets.chomp

while playing

  game.play
  Hand.create(user_hand: "#{game.hands[0]}", house_hand: "#{game.hands[1]}", user_name: "#{user_name}")

  puts "current score is: #{game.check_game.to_s}"

  puts "do you want to play this hand?"

  answer = gets.chomp
  if answer == "no"
    puts "folding"
    next
  end

  if game.check_game < -2
    playing = false
  end
end

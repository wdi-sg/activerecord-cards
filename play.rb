require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file
require_relative "models/user" # require the Hand class definition that we defined in the models/artist.rb file

require './game'
require './cards'

puts "What's your name?"
user_name = gets.chomp

User.create(name: user_name)

playing = true
# creates a new instance of a game from  Game class (from game.rb)
game = Game.new

while playing

  # calls play method from game
  game.play
  puts "current score is: #{game.check_game.to_s}"

  #stop or contiune game
  puts "do you want to play this hand? (y/n)"
  answer = gets.chomp
  if answer == "n"
    puts "folding"
    playing = false
  else answer == "y"

  end

  #end game condition
  if game.check_game <= -2
    puts "#{user_name}, try harder next time eh?"
    puts "Your result for this session as follows:"
    user_turn_number = Hand.maximum("users_id")
    last_user = Hand.where(users_id: user_turn_number)
    last_user.each { |x| puts x.card }
    playing = false
  elsif game.check_game >= 2
    puts "#{user_name}, you may have won but can you do it again?"
    puts "Your result for this session as follows:"
    user_turn_number = Hand.maximum("users_id")
    last_user = Hand.where(users_id: user_turn_number)
    last_user.each { |x| puts x.card }
    playing = false
  else
    next
  end

end
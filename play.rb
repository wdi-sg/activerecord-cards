require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "byebug" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file

require './game'
require './cards'

class Hand < ActiveRecord::Base
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :hands
end

playing = true
# creates a new instance of a game from  Game class (from game.rb)
puts "enter your name"
game = Game.new(gets.chomp)
User.new(username: game.username).save

# puts "enter your name"
# game.username=gets.chomp

while playing

  # calls play method from game
  game.play
  puts "current score is: #{game.check_game.to_s}"

  #stop or contiune game
  puts "#{game.username}, Do you want to play this hand?"
  answer = gets.chomp
  # if answer == "no"
  #   puts "folding"
  #   Hand.all.each { |hand|
  #     puts hand.hand_result
  #   }
  #   playing = false
  # end

  if answer == "no"
    puts "folding"
    User.find_by(username: game.username).hands.each {|hand|
      puts "Hand Number: #{hand.hand_no} Hand Score: #{hand.hand_result}"
    }
    playing = false
    next
  end

  #end game condition
  if game.check_game < -2
    puts "#{username}, you lost!"
    User.find_by(username: game.username).hands.each {|hand|
      puts "Hand Number: #{hand.hand_no} Hand Score: #{hand.hand_result}"
    }
    playing = false
    next
  end
  game.round +=1
  Hand.new(hand_result: game.check_game, hand_no: game.round, user_id: User.find_by(username: game.username).id).save

end

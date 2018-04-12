require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/hand" # require the Hand class definition that we defined in the models/artist.rb file

require './game'
require './cards'

playing = true
puts "\nWelcome... How can I address you?"
print "Input Name : "
user = gets.chomp.capitalize
puts "\nHello #{user}, let's start the game..."
# creates a new instance of a game from  Game class (from game.rb)

game = Game.new(user)

current_session = game.session


while playing
  
  # calls play method from game
  game.play
  puts "\nCurrent score is: #{game.check_game.to_s}"
  
  #end game condition
  if game.check_game < -2
    puts "\nGAME OVER!!! \nHave better luck next time."
    current_session_no = game.current_session
    hands_played = Hand.where(session_no: current_session_no)
    hands_played.find_each do |hand|
      puts "\n#{user}'s cards : " + hand.user_hand.to_s
      puts "Dealer's cards : " + hand.house_hand.to_s 
    end
    playing = false
  else
    #stop or contiune game
    print "\nDo you want to play this hand? (yes / no)"
    answer = gets.chomp.downcase
    if answer == "no"
      playing = false   
      current_session_no = game.current_session  
      puts "\nHope you have enjoyed. Thank you"
      hands_played = Hand.where(session_no: current_session_no)
      hands_played.find_each do |hand|
        puts "\n#{user}'s cards : " + hand.user_hand.to_s
        puts "Dealer's cards : " + hand.house_hand.to_s 
      end
    else
      game.cards_left < 20
      game.reshuffle
    end
  end 
end
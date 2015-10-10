require 'sinatra'
require 'byebug'
require_relative 'guessing_game'

get '/' do
  'Hello World'
end

get '/test' do
  'this is a test website'
end

get '/game' do
  erb :game
end

get '/too_high' do
  @score = @@game.number_of_guesses
  erb :too_high
end

get ('/too_low') do
  @score = @@game.number_of_guesses
  erb :too_low
end

get '/won' do
  'You guessed it right'
end

post '/number_guess' do
  user_number = params[:number].to_i
  @@game.user_number = user_number
  result = @@game.compare_numbers(@@game.user_number, @@game.computer_number)
  if result == 'won'
    @@game.init
    redirect to('/won')
  elsif result == 'high'
    redirect to('/too_high')
  elsif result == 'low'
    redirect to('/too_low')
  end
end

@@game = GuessingGame.new
@@game.init


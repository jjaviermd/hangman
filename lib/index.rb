require './lib/hangman.rb'
require './lib/player.rb'

puts ' Starting Hangman'
player = Player.new
game = Game.new

puts "Can you guess the secret word in 10 turns?"

until game.counter == 0 do
  player.set_guess
  game.secret_vs_guess(player.guess)
  game.show_guessess
  game.game_over if game.guess_line == game.secret
  puts "turns remaining: #{game.counter}"
  player.clear_guess
end
game.game_over



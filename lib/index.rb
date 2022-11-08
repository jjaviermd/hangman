require './lib/hangman.rb'
require './lib/player.rb'
require 'shale'
require 'byebug'

def save(ins)
  Dir.mkdir("saves") unless Dir.exist?("saves")
  yaml = ins.to_yaml
  file = File.open("saves/#{ins.class.to_s.downcase}.yaml", "w"){ |f| f.write yaml}
end

puts %q[
  Starting Hangman.
  This game saves your progress automatically.
  Do you want to load? (y/n)
]

load = gets.chomp
if load == 'y'
  game_file = File.read("saves/game.yaml")
  game = Game.from_yaml(game_file)
  player_file = File.read("saves/player.yaml")
  player = Player.from_yaml(player_file)
  puts "you have #{game.counter} turns remaining"
  game.show_guessess
  player.show_wrongs
else
  game = Game.new
  player = Player.new
  puts "Can you guess the secret word in 10 turns?"
end



until game.counter == 0 do
  #byebug
  player.set_guess
  game.secret_vs_guess(player.guess)
  game.show_guessess
  save(game)
  save(player)
  game.game_over if game.guess_line == game.secret
  puts "turns remaining: #{game.counter}"
  player.clear_guess
end
game.game_over

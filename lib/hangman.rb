require 'byebug'
SOURCE = File.readlines("1000_words.txt").
  select { |line| line.length.between?(5,12)}



class Game
  attr_reader :secret_word, :guess_line, :counter

  def initialize
    @secret_word = SOURCE.sample.chomp
    @guess_line = String.new("_") * secret_word.length 
    @counter = 10
  end

  def secret_word_vs_guess(secret_word = self.secret_word, guess)
    secret_word.include?(guess)
  end
end

game = Game.new
byebug
puts game.secret_word
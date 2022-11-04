require 'byebug'
SOURCE = File.readlines("1000_words.txt").
  select { |line| line.length.between?(5,12)}

class Game

  attr_reader :secret, :counter, :past_guesses, :guess_line
  attr_writer :guess_line

  def initialize
    @secret = SOURCE.sample.chomp.split("")
    @guess_line = Array.new(secret.length, "_")
    @counter = 10
    @past_guesses = []
  end

  def secret_vs_guess(guess)
    unless self.past_guesses.include?(guess)
      if self.secret.include?(guess)
        secret.each_with_index do |letra, i|
          if letra == guess
           self.guess_line[i] = letra
          end
       end 
      end
  end
  @counter -= 1
  self.past_guesses.push(guess)
  end
 

end

 
game = Game.new
byebug
puts game.secret_word
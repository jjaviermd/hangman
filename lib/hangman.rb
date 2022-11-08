require 'byebug'
require 'shale'
SOURCE = File.readlines("1000_words.txt").
  select { |line| line.length.between?(6,12)}

class Game < Shale::Mapper
  attribute :secret, Shale::Type::String, collection: true
  attribute :counter, Shale::Type::Integer
  attribute :guess_line, Shale::Type::String, collection: true

  attr_reader :secret, :counter, :guess_line
  attr_writer :guess_line

  def initialize
    @secret = SOURCE.sample.chomp.upcase.split("")
    @guess_line = Array.new(secret.length, "_")
    @counter = 10
  end

  def secret_vs_guess(guess)
    if self.secret.include?(guess)
      secret.each_with_index do |letra, i|
      if letra == guess
        self.guess_line[i] = letra
      end
      end 
    else 
      puts "You chossed poorly"
      @counter -= 1
    end
  end

  def show_guessess
    puts "Secret word: #{self.guess_line.join("/")}"
  end

  def game_over
    puts "GAME OVER"
    reveal_secret
    exit
  end

  def reveal_secret
    puts "The hidden word was #{self.secret.join("")}"
  end
 

end

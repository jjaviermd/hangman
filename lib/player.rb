require 'byebug'

class Player

  private
  attr_writer :p_guesses, :guess

  public
  attr_reader :p_guesses, :guess
  def initialize
    @guess = String.new
    @p_guesses = Array.new
  end

  def set_guess(letter)
    self.guess = letter.upcase
  end

  def clear_guess
    self.guess.clear
  end

  def to_p_guesses (letter)
    self.p_guesses.push(letter)
  end
end

byebug
player = Player.new
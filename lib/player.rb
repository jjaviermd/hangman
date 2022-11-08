require 'byebug'
require 'shale'

class Player < Shale::Mapper
  attribute :p_guesses, Shale::Type::String, collection: true
  attribute :guess, Shale::Type::String
  private
  attr_writer :p_guesses, :guess

  public
  attr_reader :p_guesses, :guess
  def initialize
    @guess = String.new
    @p_guesses = Array.new
  end

  def set_guess
    puts "Choose wisely"
    letter = gets.chomp.upcase
    unless self.p_guesses.include?(letter) || letter =~ /[0-9]/
    self.guess = letter[0].upcase
    self.to_p_guesses(letter)
    else 
      puts "Nah-ah!"
      set_guess
    end
  end

  def clear_guess
    self.guess.clear
  end

  def to_p_guesses(letter)
    self.p_guesses.push(letter)
  end

  def show_wrongs
    puts "Wrong letters: #{self.p_guesses.join("//")}"
  end
end

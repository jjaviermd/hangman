SOURCE = File.readlines("google-10000-english-no-swears.txt").
  select { |line| line.length.between?(6,12)}

counter = 10

secret_world = SOURCE.sample.chomp

guess_line = String.new("_") * secret_world.length

def guess_letter
  if counter == 10
    puts "wich letter will be your first guess?"
    input = gets.chomp.to_upcase
  else
   puts "Next letter?"
   input = gets.chomp.to_upcase
  end
end

guess_letter
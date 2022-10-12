SOURCE = File.readlines("google-10000-english-no-swears.txt").
  select{ |line| line.length.between?(6,12)}
  puts SOURCE
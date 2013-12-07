hands = 2
hand_count = 1
scoreboard = Hash.new
tricks_count = Hash.new

puts "Enter comma separated list of players:"
player_list = gets.chomp

players = player_list.split(",")

players.each do |player|
  puts "#{player.capitalize!}"
  scoreboard[player] = 0
end

until hands == 0

  puts "Hand #{hand_count}, deal #{hands} cards."

  players.each do |player|
    puts "How many tricks for #{player}"
    tricks = gets.chomp.to_i
    tricks_count[player] = tricks
  end

  tricks_count.each { |x, y| puts "#{x} called: #{y} Tricks" }


  tricks_count.each do |player, tricks|
    puts "Did #{player} get #{tricks} tricks?"
    tricks_scored = gets.chomp.to_s
    if tricks_scored == "y"
      tricks_won = tricks += 10
      score = scoreboard[player]
      new_score = tricks_won + score
      scoreboard[player] = new_score
    else
      tricks_won = 0
      score = scoreboard[player]
      new_score = tricks_won + score
      scoreboard[player] = new_score
    end
  end

  scoreboard.each { |x, y| puts "#{x}: #{y}" }

  hands -= 1
  hand_count += 1
end
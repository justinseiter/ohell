hands = 2
hand_count = hands - (hands - 1)
trick_value = 10
scoreboard = Hash.new
tricks_count = Hash.new

def formatted_name(name)
  name.ljust(29, '.')
end

puts "Enter comma separated list of players:"
player_list = gets.chomp

players = player_list.split(",")

players.each do |player|
  player.capitalize!
  scoreboard[player] = 0
end

30.times { print "*" }
puts ''
puts 'SCOREBOARD'
scoreboard.each { |x, y| puts "#{formatted_name(x)}#{y}" }
30.times { print "*" }
puts ''


until hands == 0

  puts "Hand #{hand_count}, deal #{hands} cards.".rjust(60, '.')
  puts ''

  players.each do |player|
    print "How many tricks for #{player}: "
    tricks = gets.chomp.to_i
    tricks_count[player] = tricks
  end

  tricks_count.each { |x, y| puts "#{x} called: #{y} Tricks".rjust(60, '.') }


  tricks_count.each do |player, tricks|
    print "Did #{player} get #{tricks} tricks? "
    tricks_scored = gets.chomp.to_s
    if tricks_scored == "y"
      tricks_won = tricks += trick_value
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

  30.times { print "*" }
  puts ''
  puts 'SCOREBOARD'
  scoreboard.each { |x, y| puts "#{formatted_name(x)}#{y}" }
  30.times { print "*" }
  puts ''


  hands -= 1
  hand_count += 1
end
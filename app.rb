# app.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
# W4D2 - Text fighting game using OOP principles in Ruby

# Useful includes
require_relative 'lib/player.rb'
# require_relative 'lib/game.rb'

# app - Main program
def app
  system('clear')
  player1 = Player.new("David")
  player2 = Player.new("Yassine")
  puts
  puts "- Get ready to rumble -"
  puts
  player1.show_state("")
  player2.show_state("")
  puts
  puts "- 3... 2... 1... Fight! -"
  round = 1
  while player1.life_points > 0 && player2.life_points >0 do 
    puts
    puts "- Round #{round} - "
    if player1.life_points > 0
      player1.attacks(player2)
    else
      break
    end
    if player2.life_points > 0
      player2.attacks(player1)
    else
      break
    end
    player1.show_state("  ")
    player2.show_state("  ")
    round += 1
  end
  puts "- End of fight - "
  puts
end

# Launch of "app" main program
app

# app.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
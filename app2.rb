# app2.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
# W4D2 - Text fighting game using OOP principles in Ruby (v2.0)

# Useful includes
require_relative 'lib/player.rb'
require_relative 'lib/humanplayer.rb'

# print_marquee - Display the game intro streamer
def print_marquee(spacer)
  a = "\u256d".encode('utf-8') # top-left-hand corner
  b = "\u256e".encode('utf-8') # top-right-hand corner
  c = "\u256f".encode('utf-8') # bottom-right-hand corner
  d = "\u2570".encode('utf-8') # bottom-left-hand corner
  e = "\u2502".encode('utf-8') # vertical line
  f = "\u2500".encode('utf-8') # horizontal line
  g = "\u251c".encode('utf-8') # left crossroads
  h = "\u2524".encode('utf-8') # right crossroads
  i = "\u2665".encode('utf-8') # heart
  puts
  puts
  puts spacer+a+f*48+b
  puts spacer+e+" "*48+e
  puts spacer+e+"              THEY ALL WANT MY OOP              "+e
  puts spacer+e+" "*48+e
  puts spacer+e+" "*48+e
  puts spacer+e+"      Kill... Or be killed. Simple. Basic.      "+e
  puts spacer+e+" "*48+e
  puts spacer+e+" "*48+e
  puts spacer+g+f*48+h
  puts spacer+e+" © 2022 GibbZ               Made with "+i+" for THP "+e
  puts spacer+d+f*48+c
  puts
  puts 
end

# input_human_player - prompt the user for the name of his / her hero fighter
def input_human_player
  puts $decals+"First of all, tell us what your name is, stranger?"
  print $decals+"> "
  tmp_name = gets.chomp
  puts
  return tmp_name
end

# fight_menu - Prompt the user for what action he/she wants to make (search weapon, search health, attack a bot player...)
def fight_menu(spacer, bad1, bad2)
  a = "\u256d".encode('utf-8') # top-left-hand corner
  b = "\u256e".encode('utf-8') # top-right-hand corner
  c = "\u256f".encode('utf-8') # bottom-right-hand corner
  d = "\u2570".encode('utf-8') # bottom-left-hand corner
  e = "\u2502".encode('utf-8') # vertical line
  f = "\u2500".encode('utf-8') # horizontal line
  g = "\u251c".encode('utf-8') # left crossroads
  h = "\u2524".encode('utf-8') # right crossroads
  i = "\u2665".encode('utf-8') # heart
  tmp_choice=""
  tmp_space=""
  puts
  puts spacer+a+f*48+b
  puts spacer+e+" "*48+e
  puts spacer+e+"           What are you going to do ?           "+e
  puts spacer+e+" "*48+e
  puts spacer+g+f*48+h
  puts spacer+e+" "*48+e
  puts spacer+e+"  w - Search around for a better (w)eapon       "+e
  puts spacer+e+"  h - Try to (h)eal yourself                    "+e
  puts spacer+e+"  q - Give up the fight and (q)uit the game     "+e
  puts spacer+e+" "*48+e
  puts spacer+g+f*48+h
  puts spacer+e+" "*48+e
  if bad1.life_points > 0
    tmp_space=" "*(48-29-(bad1.name.length+bad1.life_points.to_s.length))
    puts spacer+e+"  1 - Attack #{bad1.name} who has #{bad1.life_points}"+i+" left."+tmp_space+e
  end
  if bad2.life_points > 0
    tmp_space=" "*(48-29-(bad2.name.length+bad2.life_points.to_s.length))
    puts spacer+e+"  2 - Attack #{bad2.name} who has #{bad2.life_points}"+i+" left."+tmp_space+e
  end
  puts spacer+e+" "*48+e
  puts spacer+g+f*48+h
  puts spacer+e+" "*48+e
  print spacer+e+"  > "
  tmp_choice = gets.chomp
  puts spacer+e+" "*48+e
  puts spacer+d+f*48+c
  puts
  puts 
  return tmp_choice.upcase
end

def end_message(spacer, my_message)
  a = "\u256d".encode('utf-8') # top-left-hand corner
  b = "\u256e".encode('utf-8') # top-right-hand corner
  c = "\u256f".encode('utf-8') # bottom-right-hand corner
  d = "\u2570".encode('utf-8') # bottom-left-hand corner
  e = "\u2502".encode('utf-8') # vertical line
  f = "\u2500".encode('utf-8') # horizontal line
  g = "\u251c".encode('utf-8') # left crossroads
  h = "\u2524".encode('utf-8') # right crossroads
  i = "\u2665".encode('utf-8') # heart
  tmp_space1 = ""
  tmp_space2 = ""
  puts
  puts spacer+a+f*48+b
  puts spacer+e+" "*48+e
  puts spacer+e+"              THEY ALL WANT MY OOP              "+e
  puts spacer+e+" "*48+e
  puts spacer+e+" "*48+e
  tmp_space1 = " "*((48-my_message.length)/2)
  if tmp_space1.length % 2 == 0 
    tmp_space2 = tmp_space1
  else
    tmp_space2 = tmp_space1 + " "
  end
  puts spacer+e+tmp_space1+my_message+tmp_space2+e
  puts spacer+e+" "*48+e
  puts spacer+e+" "*48+e
  puts spacer+g+f*48+h
  puts spacer+e+" © 2022 GibbZ               Made with "+i+" for THP "+e
  puts spacer+d+f*48+c
  puts
  puts 
end

# app2 - Main program
def app2
  system('clear')
  $decals = " "*20
  print_marquee($decals)
  hero = HumanPlayer.new(input_human_player)
  ennemies = [Player.new("José"), Player.new("Josiane")]
  round = 1
  while (hero.life_points >0 && (ennemies[0].life_points > 0 || ennemies[1].life_points > 0)) do
    puts
    puts $decals+"- ROUND #{round} - "
    puts
    hero.show_state($decals)
    ennemies[0].show_state($decals)
    ennemies[1].show_state($decals)
    case fight_menu($decals,ennemies[0], ennemies[1])
    when "W"
      hero.search_weapon($decals)
    when "H"
      hero.search_health_pack($decals)
    when "1"
      hero.attacks($decals, ennemies[0])
    when "2"
      hero.attacks($decals, ennemies[1])
    else
      break
    end
    if ennemies[0].life_points > 0 
      ennemies[0].attacks($decals, hero) 
    end
    if ennemies[1].life_points > 0 && hero.life_points > 0
      ennemies[1].attacks($decals, hero) 
    end
    round += 1
  end
  if hero.life_points > 0
    if ennemies[0].life_points <= 0 && ennemies[1].life_points <= 0
      end_message($decals, "Congratulations! You survived OOP v2.0!")
    else
      end_message($decals, "And so you fleed like a little coward...")
    end
  else
    end_message($decals, "Our bots were much stronger than you, again...")
  end
end

# Launch of "app2" main program
app2

# app2.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
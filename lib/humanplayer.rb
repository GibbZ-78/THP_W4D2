# humanplayer.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
# HumanPlayer is a specialization of the Player class (i.e. gets most its characteristics from Player by inheritance)

# Useful includes
require_relative 'player.rb'

class HumanPlayer < Player
  attr_accessor :weapon_level
  @@weapon_class = ["rock","knife","sword","arbalest","pistol","machine gun"]

  def initialize(person_name)
    @name = person_name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state(spacer)
    puts spacer+"> #{self.name} has #{self.life_points}"+"\u2665".encode('utf-8')+" left and holds a #{HumanPlayer.weapon_equiv(self.weapon_level)}."
  end

  def compute_damage
    rand(1..6) * self.weapon_level
  end

  def search_weapon(spacer)
    found_weapon_level = rand(1..6)
    puts spacer+"> You just found a #{HumanPlayer.weapon_equiv(found_weapon_level)}."
    if found_weapon_level > self.weapon_level
      puts spacer+"  Yeepee! It is so much more powerful than your #{HumanPlayer.weapon_equiv(self.weapon_level)} that you decide to switch weapon!"
      self.weapon_level = found_weapon_level
    else
      puts spacer+"  Holy crap! This is not what you expected, hence decide to keep your #{HumanPlayer.weapon_equiv(self.weapon_level)} and leave this M@%F*&g #{HumanPlayer.weapon_equiv(found_weapon_level)} where it stands."
    end
  end

  def search_health_pack(spacer)
    found_health_pack_or_not = rand(1..6)
    case found_health_pack_or_not
    when 1
      puts spacer+"> Despite trying hard, you found nothing interesting here..."
    when 2, 3, 4, 5
      puts spacer+"> Yepee Kaï, Cowboy! Looks like you've found a 50"+"\u2665".encode('utf-8')+" medikit."
      self.life_points = (self.life_points+50 > 100 ? 100 : self.life_points+50)
    when 6
      puts spacer+"> Holy sh**! What a lucky fighter you are : you just got your hand on a 80"+"\u2665".encode('utf-8')+" health pack."
      self.life_points = (self.life_points+80 > 100 ? 100 : self.life_points+80)
    end
  end

  private

  def self.weapon_equiv(weapon_power)
    return @@weapon_class[weapon_power-1]+"(#{weapon_power})"
  end

end

# humanplayer.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
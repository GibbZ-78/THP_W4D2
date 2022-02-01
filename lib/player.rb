# player.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022

class Player
  attr_accessor :name, :life_points
  # @@bot_players = []

  def initialize(player_name)
    @life_points = 10
    @name = player_name
    # @@bot_players.push(self)
  end

  def show_state(spacer)
    puts spacer+"> #{self.name}[Bot] has #{self.life_points}"+"\u2665".encode('utf-8')+" left."
  end

  def gets_damage(spacer, damage_amount)
    self.life_points -= damage_amount
    if self.life_points <= 0
      puts spacer+"> #{self.name} is dead..."
    end
  end

  def attacks(spacer, target_player)
    print spacer+"> #{self.name} attacks #{target_player.name} "
    tmp_damage = Player.compute_damage
    puts "inflicting him/her #{tmp_damage}"+"\u2665".encode('utf-8')+" of damages."
    target_player.gets_damage(spacer, tmp_damage)
  end

  private

  def self.compute_damage
    return rand(1..6)
  end


end

# player.rb - Coded with love by Jean-Baptste VIDAL for THP Winter 2022
require 'pry'

class Player

  attr_accessor :name, :life_points
  @@all_players = []

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
    @@all_players << self
  end

  # Show_state annonce le nom du joueur et ses points de vie
  def show_state
    puts "#{self.name} a #{self.life_points} points de vie."
  end # def show_state

   # get_damage montre le nombre de dégâts que reçoit notre joueur. Damage est un nombre entier
  def get_damage(damage) 
    @life_points = self.life_points - damage
    if self.life_points <= 0
      puts "Le joueur #{self.name} a été tué ! "
    end
  end # def get_damage
   
  def attacks(all_players)
    puts "Le joueur #{self.name} attaque le joueur #{all_players.name}"
    att = compute_damage
    puts "il lui inflige #{att} points de dommages"
    all_players.get_damage(att)
  end # def attacks

  def compute_damage
    return rand(1..6)
  end # def compute damage

end # class Player
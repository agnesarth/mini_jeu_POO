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
   
  # attaque d'un joueur vers l'autre et vérifie avec la def get_damage si le joueur est KO
  def attacks(all_players)
    puts "Le joueur #{self.name} lance son meilleur combo sur #{all_players.name}"
    att = compute_damage
    puts "il lui inflige #{att} points de dommages"
    all_players.get_damage(att)
  end # def attacks

  def compute_damage
    return rand(1..6)
  end # def compute damage

end # class Player


class HumanPlayer < Player
  attr_accessor :weapon_level
  @@all_players = []

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
    @@all_players << self
  end
   # Show_state annonce le nom du joueur, ses points de vie et le niveau de son arme
  
  def show_state
    puts "#{self.name} a #{self.life_points} points de vie et son arme est de niveau #{self.weapon_level}."
  end # show_state
  
  def compute_damage
    rand(1..6) * @weapon_level
  end # compute_damage
  
  # Recherche d'une nouvelle arme pour booster l'attaque
  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as obtenu une nouvelle arme de niveau #{new_weapon}"
    if new_weapon > self.weapon_level
      self.weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end #if
  end # search_weapon
  
  # Recherche d'un pack de santé pour remonter la barre de vie du joueur à 100 max
  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1 
      puts "Tu n'as rien trouvé... "
    elsif health_pack >= 2 && health_pack >= 5
      # Si le player a moins de 50/100 PV , récupérer 50 PV, sinon, récupérer les PV manquant
      if (100 - self.life_points) >= 50
        self.life_points = self.life_points + 50
      else
        self.life_points = self.life_points + (100 - self.life_points)
      end 
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      # Si le player a moins de 20/100 PV , récupérer 80 PV, sinon, récupérer les PV manquant
      if (100 - self.life_points) >= 80
        self.life_points = self.life_points + 80
      else
        self.life_points = self.life_points + (100 - self.life_points)
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end # if
  end # search_health_pack
  
end # HumanPlayer
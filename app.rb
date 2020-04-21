require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
puts "A ma gauche, la newbie Josiane, reine de la tisane !"
player2 = Player.new("José")
puts "A ma droite, le favori 2020,  le Gladiateur invaincu Josééééééééé !!!"

while player1.life_points > 0 && player2.life_points > 0
puts "-----------------------------"
puts "Voici l'état de chaque joueur :"
print player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"
player1.attacks(player2)
  if player2.life_points > 0
    player2.attacks(player1)
  end
end

binding.pry
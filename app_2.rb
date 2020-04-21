require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def welcome_to_poomanji
  puts "|///////////////////////////////////////////////////////////////|"
  puts "|                        Bienvenue sur                          |"
  puts "| 'IL NE FAUT PAS VENDRE LA POO DE L'OURS AVANT DE l'AVOIR TUE' |"
  puts "|                    Match à mort par équipe                    |"
  puts "|///////////////////////////////////////////////////////////////|"
end
welcome_to_poomanji

# Définir le nom de ton personnage
puts " "
print "Dis moi, comment tu t'appelles jeune padawan ?"
print "> "
name_to_save = gets.chomp
player1 = HumanPlayer.new("#{name_to_save}")
puts "Bienvenue dans l'arène #{name_to_save} !"

# Voilà tes ennemis !
villains = []
villain1 = Player.new("Josiane")
villain2 = Player.new("José")
villains << villain1
villains << villain2
sleep(2)
puts "On ne les présente plus, nos Bonnie & Clyde entrent à leur tour dans l'arène : José et Josianne !!"
sleep(2)
while (villain1.life_points > 0 || villain2.life_points > 0) && player1.life_points > 0
  puts " "
  puts "Voici l'état de ton joueur :"
  print player1.show_state
  sleep (3)
  puts " "
  
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "Attaquer un joueur en vue :"
  if villain1.life_points > 0
    print "0 - "
    print "#{villain1.show_state}"
  end
  if villain2.life_points > 0
    print "1 - "
    print"#{villain2.show_state}"
  end
  print ">"
  action = gets.chomp
  sleep(3)
  if action == "a"
    player1.search_weapon
  elsif action == "s"
    player1.search_health_pack
  elsif action == "0"
    player1.attacks(villain1)
  elsif action == "1"
    player1.attacks(villain2)
  else
    puts "T'es mauvais Jack, on saute ton tour"  
  end
sleep(3)
puts " "
  if villain1.life_points > 0 || villain2.life_points > 0
    puts "Attention on t'attaque !"
  end
sleep(1)
  villains.each do |a|
    if a.life_points > 0
      a.attacks(player1)
      sleep(4)
    end
  end
end

puts "La partie est finie"
if player1.life_points > 0
  puts "Youhou ! Tu as battu José et Josianne !"
else
  puts "Game over, loser !"
end

binding.pry

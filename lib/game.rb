require 'pry'

class Game
  require_relative 'player'
  attr_accessor :human_player, :villains
  @@all_villains = []
  def initialize(name_to_save)
    villain1 = Player.new("Josiane")
    villain2 = Player.new("José")
    villain3 = Player.new("Jorgina")
    villain4 = Player.new("Josélito")
    @@all_villains = [villain1, villain2, villain3, villain4]
    @human_player = HumanPlayer.new("#{name_to_save}")
  end

  def kill_player(all_villains)
    @@all_villains.delete(@@all_villains.name)
  end

binding.pry
end
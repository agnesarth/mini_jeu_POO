require 'bundler'
Bundler.require


class Game
  require_relative 'player'
  attr_accessor :human_player, :villains

  villain1 = Player.new("Josiane")
  villain2 = Player.new("José")
  villain3 = Player.new("Jorgina")
  villain4 = Player.new("Josélito")
  @villains = [villain1, villain2, villain3, villain4] #

  def initialize (name_to_save) #moi = Game.new("Hercule")
    @human_player = HumanPlayer.new("#{name_to_save}") #test avec moi.human_player.show_state
  end

  def kill_player(player_to_kill) #test avec moi.kill_player("villain1")
    @villains.each do |player|
      @villains.delete(player) if player.name == player_to_kill
      return @villains
    end
  end



binding.pry
end
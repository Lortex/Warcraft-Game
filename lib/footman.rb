# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'
class Footman < Unit
  
  def initialize(health_points = 60, attack_power = 10)
    @health_points = health_points
    @attack_power = attack_power
    @type = 'fleshy'
  end

  #def attack!(enemy)
  #  enemy.damage(@attack_power)
  #end

  #def damage(ap)
  #  @health_points -= ap
  #end
  
  #def initialize
    #@health_points = 60
    #@attack_power = 10
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
  #end
end

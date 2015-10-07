

class Unit
attr_reader :health_points, :attack_power, :modifier, :type
  
  def initialize(health, ap)
    @health_points = health
    @attack_power = ap
    @type = 'neutral'
  end
  
  def attack!(enemy)
    enemy.damage(@attack_power) if alive?
  end

  def damage(ap, modifier = 1)
    @health_points -= ap * modifier if alive?
    @health_points = 0 if @health_points < 0 
  end

  def alive?
    health_points > 0
  end

end


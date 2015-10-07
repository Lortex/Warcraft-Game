class Unit
attr_reader :health_points, :attack_power
  
  def initialize(health, ap)
    @health_points = health
    @attack_power = ap
  end
  
  def attack!(enemy)
    enemy.damage(@attack_power)
  end

  def damage(ap)
    @health_points -= ap
  end
end


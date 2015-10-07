require_relative 'unit'
class SiegeEngine < Unit

  def initialize(health_points = 400, attack_power = 50)
    @health_points = health_points
    @attack_power = attack_power
    @modifier = 4
    @type = 'vehicle'
  end

  def attack!(enemy)
    enemy.damage(@attack_power, @modifier) if enemy.type == 'structure'
    enemy.damage(@attack_power) if enemy.type == 'vehicle'
  end
end

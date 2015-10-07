require_relative 'unit'

class Peasant < Unit

  def initialize
    @health_points = 35
    @attack_power = 0
    @type = 'fleshy'
  end


end

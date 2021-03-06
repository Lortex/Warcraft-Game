require_relative 'footman'
require_relative 'peasant'
require_relative 'unit'

class Barracks < Unit
attr_reader :gold, :food, :lumber

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
    @armor = 0.5
    @type = 'structure'
  end

  def can_train_footman?
    (food >= 2) && (gold >= 135)
  end

  def can_train_peasant?
    (food >= 5) && (gold >= 90)
  end

  def can_train_siege?
    (food >= 3) && (gold >= 200) && (lumber >= 60)
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def train_siege
    if can_train_siege?
      @food -= 3
      @gold -= 200
      @lumber -= 60
      SiegeEngine.new
    end
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end
 #added a modifier. footman will just eat the armor reduction. siege will gain big modifier that multiplies  
  def damage(ap, modifier = 1)
    @health_points -= (ap * modifier * @armor).ceil
  end

end

class Ingredient
  attr_accessor :name, :cost
  def initialize(hash)
    @name = hash[:name]
    @cost = hash[:cost]
  end

  def ==(ingredient)
    return false unless ingredient.is_a?(Ingredient)
     ingredient.name == self.name && ingredient.cost == self.cost
  end
end
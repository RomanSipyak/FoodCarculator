class Recipe
  attr_accessor :ingredient_quantities
  attr_reader :serving_count
  def initialize(hash, quantities)
    @name = hash[:name]
    @serving_count = hash[:serving_count]
    @ingredient_quantities = quantities
  end

  def total_cost
    ingredient_quantities.reduce(0) do |memo, x|
      memo + x.total_cost
    end
  end

  def cost_of_one_serving
    total_cost / @serving_count
  end

  def ingredient_quantities_per_servings(number)
    if number < 1
      raise(ArgumentError, 'you caan`t enter on negative digit')
    end
    ingredient_quantities.map do |ingred_q|
      ingred_q.quantity = (ingred_q.quantity / @serving_count * number)
      ingred_q
    end
  end

  def ingredient_quantities_per_one_serving
    ingredient_quantities_per_servings(1)
  end
end
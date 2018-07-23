class IngredientQuantity
  attr_accessor :quantity, :ingredient
  def initialize(ingredient, quantity)
    @ingredient = ingredient
    @quantity = quantity
  end

  def total_cost
    ingredient.cost * quantity / 1000
  end

  def +(ingredient_q)
    if ingredient == ingredient_q.ingredient
      total = quantity + ingredient_q.quantity
      init = { name: ingredient_q.ingredient.name }
      init[:cost] = ingredient_q.ingredient.cost
      IngredientQuantity.new(Ingredient.new(init), total)
    else
      raise 'arguments are not equal'
    end
  end

  def *(number)
    if number < 1
      raise(ArgumentError, 'you multiply on negative digit')
    else
      IngredientQuantity.new(ingredient, quantity * number)
    end
  end

  def ==(quantity)
    return false unless quantity.is_a?(IngredientQuantity)
    quantity.ingredient == ingredient && quantity.quantity == self.quantity
  end
end

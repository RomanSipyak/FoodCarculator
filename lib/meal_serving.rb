class MealServing
  attr_accessor :times, :recipe
  def initialize(times, recipe)
    if times < 1
      raise(ArgumentError, 'you can`t enter on negative digit in constructor')
    end
    @times = times
    @recipe = recipe
  end

  def times=(number)
    if number < 1
      raise(ArgumentError, 'you can`t enter on negative digit')
    else
      @times = number
    end
  end

  def total_cost
    recipe.cost_of_one_serving * times
  end

  def total_ingredient_quantities
    recipe.ingredient_quantities_per_servings(times)
  end
end
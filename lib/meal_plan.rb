class MealPlan
  attr_reader :individuals_count, :meal_serving
  def initialize(name, individuals_count, meal_serving)
    if individuals_count < 1
      raise(ArgumentError, 'you can`t enter on negative digit in constructor')
    end
    @name = name
    @individuals_count = individuals_count
    @meal_serving = meal_serving
  end

  def individuals_count=(number)
    if number < 1
      raise(ArgumentError, 'you can`t enter on negative digit')
    else
      @individuals_count = number
    end
  end

  def total_cost
    meal_serving.reduce(0) { |mem, x| mem + (x.total_cost * individuals_count) }
  end

  def grouped_ingredient_quantities
    meal_serving_res = meal_serving.map do |servis|
      servis.times *= individuals_count
      servis
    end
    meal_serving_res.map!(&:total_ingredient_quantities)
    meal_serving_res = meal_serving_res.flatten
    i = 0
    puts  meal_serving_res
    while i < meal_serving_res.size
      a = i + 1
      while a < meal_serving_res.size
        if meal_serving_res[i].ingredient == meal_serving_res[a].ingredient
          meal_serving_res[i].quantity = meal_serving_res[i].quantity + meal_serving_res[a].quantity
          meal_serving_res[a] = nil
        end
        meal_serving_res.compact!
        a += 1
      end
      i += 1
    end
    meal_serving_res
  end
end

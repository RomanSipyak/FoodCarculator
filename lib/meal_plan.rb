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
# i don't test this method
  def grouped_ingredient_quantities
    meal_serving_res = meal_serving.map { |servis| servis.times = servis.times * individuals_count }
    meal_i_quantity_res = meal_serving_res.map(&:total_ingredient_quantities)
    meal_i_quantity_res.flatten
    meal_i_quantity_res.group_by { |i| i }
    res_q = []
    meal_i_quantity_res.each do |key, value|
        value_q = [value[0].quantity = value.reduce(0) do |mem, x|
          mem + x.quantity
        end]
        res_q + value_q

    end
    res_q
  end
end

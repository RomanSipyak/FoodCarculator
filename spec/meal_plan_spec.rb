require 'ingredient'
require 'ingredient_quantity'
require 'recipe'
require 'meal_serving'
require 'meal_plan'

describe MealPlan do
  before(:each) do
    @arr = []
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100), 100))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Potaeweweto', cost: 50), 100))
    recipe = Recipe.new({ name: 'borsch', serving_count: 5 }, @arr)
    meal_ser = MealServing.new(5, recipe)
    @arr = []
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100), 100))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Carrot', cost: 50), 100))
    recipe = Recipe.new({ name: 'food', serving_count: 3 }, @arr)
    meal_ser2 = MealServing.new(3, recipe)
    @arr = []
    @arr.push(meal_ser)
    @arr.push(meal_ser2)
    @meal_plan = described_class.new("plan", 7, @arr)
    @arr = []
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100),1393))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Potaeweweto', cost: 50),700))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Carrot', cost: 50), 693))
  end
  describe 'constructor and setter' do
    context 'enter negative digit' do
      it 'negative in constructor' do
        expect { MealPlan.new("plan", -7, @arr) }.to raise_error(ArgumentError, 'you can`t enter on negative digit in constructor')
      end
      it 'negative in setter' do
        expect { @meal_plan.individuals_count = -1 }.to raise_error(ArgumentError, 'you can`t enter on negative digit')
      end
    end
  end

  describe '#total_cost' do
    context 'return total cost of times recive' do
      it { expect(@meal_plan.total_cost).to eq(210) }
      it do
        @meal_plan.individuals_count = 1
        expect(@meal_plan.total_cost).to eq(30)
      end
    end
  end

  describe '#grouped_ingredient_quantities' do
    context 'return arr update to enter digit ' do
      it do
        expect(@meal_plan.grouped_ingredient_quantities).to eq(@arr)
      end
    end
  end



end



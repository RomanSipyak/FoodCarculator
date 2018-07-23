require 'ingredient'
require 'ingredient_quantity'
require 'recipe'
require 'meal_serving'

describe MealServing do
  before(:each) do
    @arr = []
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100), 100))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Potato', cost: 50), 100))
    hash = { name: 'borsch', serving_count: 5 }
    @recipe = Recipe.new(hash, @arr)
    @meal_ser = MealServing.new(5, @recipe)
  end
  describe 'constructor and setter' do
    context 'enter negative digit' do
      it 'negative in constructor' do
        expect{ MealServing.new(-1, @recipe) }.to raise_error(ArgumentError, 'you can`t enter on negative digit in constructor')
      end
      it 'negative in setter' do
        expect{ @meal_ser.times = -1 }.to raise_error(ArgumentError, 'you can`t enter on negative digit')
      end
    end
  end
  describe '.total_cost' do
    context 'return total cost of times recive' do
      it { expect(@meal_ser.total_cost).to eq(15) }
      it do
        @meal_ser.times = 1
        expect(@meal_ser.total_cost).to eq(3)
      end
    end
  end
  describe '.total_ingredient_quantities' do
    context 'returm arr update to enter digit ' do
      it do
        expect(@meal_ser.total_ingredient_quantities).to eq(@recipe.ingredient_quantities_per_servings(@meal_ser.times))
      end
    end
  end
end



require 'ingredient'
require 'ingredient_quantity'
require 'recipe'

describe Recipe do
  before(:each) do
    @arr = []
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100), 100))
    @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Potato', cost: 50), 100))
    hash = { name: 'borsch', serving_count: 5 }
    @recipe = Recipe.new(hash, @arr)
  end
  describe '.total_cost' do
    context 'return total cost of recipe' do
      it { expect(@recipe.total_cost).to eq(15) }
      it do
        ingredient = IngredientQuantity.new(Ingredient.new(name: 'Potato', cost: 100), 150)
        @recipe.ingredient_quantities = @recipe.ingredient_quantities.push(ingredient)
        expect(@recipe.total_cost).to eq(30)
      end
    end
  end
  describe '.cost_of_one_serving' do
    context 'return cost of one servicing' do
      it do
        expect(@recipe.cost_of_one_serving) .to eq(3)
      end
    end
  end
  describe '.ingredient_quantities_per_servings' do
    context 'returm arr update to enter digit ' do
      it do
        expect(@recipe.ingredient_quantities_per_servings(5)).to eq(@recipe.ingredient_quantities)
      end
      it do
        expect{@recipe.ingredient_quantities_per_servings(-1)}.to raise_error(ArgumentError, 'you caan`t enter on negative digit')
      end
    end
  end
  describe '.ingredient_quantities_per_one_serving' do
    context 'return arr udate for one service' do
      it do
        @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Tomato', cost: 100), 20))
        @arr.push(IngredientQuantity.new(Ingredient.new(name: 'Potato', cost: 50), 20))
        expect(@recipe.ingredient_quantities_per_one_serving).to eq(@arr)
      end
    end
  end
end


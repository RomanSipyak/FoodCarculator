require 'ingredient'
require 'ingredient_quantity'
describe IngredientQuantity do

  describe '#total_cost' do
    let(:quantity_1) { described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 100) }
    let(:quantity_2) { described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 150) }
    it { expect(quantity_1.total_cost).to eq(10) }
    it { expect(quantity_2.total_cost).to eq(15) }
  end

  describe '#+' do
    let(:quantity_1) { described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 100) }
    let(:quantity_2) { described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 150) }

    context 'when quantity_1 + quantity_2 with equal ingredients' do
      it 'return new IngredientQuantity' do
        result = described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 250)
        expect(quantity_1 + quantity_2).to eq(result)
      end
    end
    context 'when + quantities with different ingredient' do
      ingredient = Ingredient.new(name: 'Potato', cost: 100)
      let(:potato) { described_class.new(ingredient, 150) }
      it 'they ingredient are not equal return raise_error' do
        expect { quantity_2 + potato }.to raise_error('arguments are not equal')
      end
    end
  end

  describe '#*' do
    let(:quantity_1) { described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 100) }
    it 'raise multiply negativ digit' do
      expect { quantity_1 * -5 }.to raise_error(ArgumentError, 'you multiply on negative digit')
    end
    it 'return new quantity muultiply on value' do
      expect(quantity_1 * 5).to eq(described_class.new(Ingredient.new(name: 'Tomato', cost: 100), 500))
    end
  end
end

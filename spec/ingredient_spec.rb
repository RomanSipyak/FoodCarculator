require 'ingredient'
describe Ingredient do
  describe '#==' do
    let(:pomodoro) { described_class.new(name: 'Tomato', cost: 100) }

    context 'when ingredients are equal' do

      let(:tomato) { described_class.new(name: 'Tomato', cost: 100) }

      it 'they are truly equal' do
        expect(pomodoro).to eq(tomato)
      end
    end

    context 'when ingredients are different' do
      let(:potato) { described_class.new(name: 'Potato', cost: 90) }

      it 'they are not equal' do
        expect(pomodoro).not_to eq(potato)
      end
    end

  end
end


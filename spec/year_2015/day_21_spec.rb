require 'year_2015/day_21'

describe Year2015::Day21 do
  context 'when Results' do
    subject(:input_data) do
      {
        hp: 100,
        damage: 8,
        armor: 2
      }
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(91)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(158)
    end
  end
end

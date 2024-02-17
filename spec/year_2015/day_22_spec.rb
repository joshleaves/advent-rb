require 'year_2015/day_22'

describe Year2015::Day22 do
  context 'when Results' do
    subject(:input_data) do
      {
        hp: 55,
        damage: 8
      }
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(953)
    end

    it 'correctly answers part 2', skip: 'Does not work properly' do
      expect(described_class.new(input_data).to_i).to eq(1289)
    end
  end
end

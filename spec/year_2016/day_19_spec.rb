require 'year_2016/day_19'

describe Year2016::Day19 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('5', true).solve).to eq(3)
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      expect(described_class.new('5').solve).to eq(2)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_19_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).solve).to eq(1_830_117)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).solve).to eq(1_417_887)
    end
  end
end

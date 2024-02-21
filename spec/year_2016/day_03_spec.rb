require 'year_2016/day_03'

describe Year2016::Day03 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('5 10 25', true).to_i).to eq(0)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_03_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(993)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(1849)
    end
  end
end

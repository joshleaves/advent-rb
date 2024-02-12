require 'year_2015/day_17'

describe Year2015::Day17 do
  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_17_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(1638)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(17)
    end
  end
end

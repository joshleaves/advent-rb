require 'year_2016/day_10'

describe Year2016::Day10 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2016/day_10_sample_one'), true)
    end

    it 'gives a final result' do
      expect(sample_one.solve(2, 5)).to eq(2)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_10_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).solve(17, 61)).to eq(157)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).solve(-1, -1)).to eq(1085)
    end
  end
end

require 'year_2016/day_15'

describe Year2016::Day15 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2016/day_15_sample_one'), true)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(5)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_15_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(203_660)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(2_408_135)
    end
  end
end

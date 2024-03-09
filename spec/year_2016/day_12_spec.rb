require 'year_2016/day_12'

describe Year2016::Day12 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2016/day_12_sample_one')).program
    end

    it 'gives a final result' do
      sample_one.execute
      expect(sample_one.registers['a']).to eq(42)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_12_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).part_one).to eq(318_007)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).part_two).to eq(9_227_661)
    end
  end
end

require 'year_2015/day_23'

describe Year2015::Day23 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_23_sample_one')).program
    end

    it 'gives a final result' do
      sample_one.execute
      expect(sample_one.registers['a']).to eq(2)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_23_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).part_one).to eq(307)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).part_two).to eq(160)
    end
  end
end

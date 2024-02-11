require 'year_2015/day_13'

describe Year2015::Day13 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_13_sample_one'), true)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(330)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_13_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(709)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(668)
    end
  end
end

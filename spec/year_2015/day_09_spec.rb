require 'year_2015/day_09'

describe Year2015::Day09 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_09_sample_one'), true)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(605)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2015/day_09_sample_one'))
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(982)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_09_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(117)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(909)
    end
  end
end

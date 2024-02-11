require 'year_2015/day_04'

describe Year2015::Day04 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_04_sample_one'), true)
    end

    it 'finds winning numbers' do
      [[17, 48, 83, 86], [32, 61], [1, 21], [84], [], []].each_with_index do |result, i|
        expect(sample_one.lines[i].winning_numbers).to eq(result)
      end
    end

    it 'calculates points' do
      [8, 2, 2, 1, 0, 0].each_with_index do |result, i|
        expect(sample_one.lines[i].to_i).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(13)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2015/day_04_sample_one'))
    end

    it 'distributes cards' do
      [1, 2, 4, 8, 14, 1].each_with_index do |result, i|
        expect(sample_two.lines[i].quantity).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(30)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_04_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(17803)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(5554894)
    end
  end
end

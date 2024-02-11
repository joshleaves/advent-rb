require 'year_2015/day_08'

describe Year2015::Day08 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_08_sample_one'), true)
    end

    it 'calculates data length of each code' do
      [2, 5, 10, 6].each_with_index do |value, i|
        expect(sample_one.lines[i].code).to eq(value)
      end
    end

    it 'calculates data length of total code' do
      expect(sample_one.code).to eq(23)
    end

    it 'calculates data length of each memory' do
      [0, 3, 7, 1].each_with_index do |value, i|
        expect(sample_one.lines[i].memory).to eq(value)
      end
    end

    it 'calculates data length of total memory' do
      expect(sample_one.memory).to eq(11)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(12)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2015/day_08_sample_one'))
    end

    it 'calculates data length of each dump' do
      [6, 9, 16, 11].each_with_index do |value, i|
        expect(sample_two.lines[i].dumped).to eq(value)
      end
    end

    it 'calculates data length of total dump' do
      expect(sample_two.dumped).to eq(42)
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(19)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_08_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(1333)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(2046)
    end
  end
end

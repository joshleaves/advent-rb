require 'year_2015/day_08'

describe Year2015::Day08 do
  context 'Part 1' do
    subject do
      Year2015::Day08.new(File.read('spec/year_2015/day_08_sample_one'), true)
    end

    it 'calculates data length of code' do
      [2, 5, 10, 6].each_with_index do |value, i|
        expect(subject.lines[i].code).to eq(value)
      end
      expect(subject.code).to eq(23)
    end

    it 'calculates data length in memory' do
      [0, 3, 7, 1].each_with_index do |value, i|
        expect(subject.lines[i].memory).to eq(value)
      end
      expect(subject.memory).to eq(11)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(12)
    end
  end

  context 'Part 2' do
    subject do
      Year2015::Day08.new(File.read('spec/year_2015/day_08_sample_one'))
    end

    it 'calculates data length of dump' do
      [6, 9, 16, 11].each_with_index do |value, i|
        expect(subject.lines[i].dumped).to eq(value)
      end
      expect(subject.dumped).to eq(42)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(19)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_08_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day08.new(subject, true).to_i).to eq(1333)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day08.new(subject).to_i).to eq(2046)
    end
  end
end

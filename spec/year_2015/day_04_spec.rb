require 'year_2015/day_04'

describe Year2015::Day04 do
  context 'Part 1' do
    subject do
      Year2015::Day04.new(File.read('spec/year_2015/day_04_sample_one'), true)
    end

    it 'finds winning numbers' do
      [
        [17, 48, 83, 86],
        [32, 61],
        [1, 21],
        [84],
        [],
        []
      ].each_with_index do |result, i|
        expect(subject.lines[i].winning_numbers).to eq(result)
      end
    end

    it 'calculates points' do
      [8, 2, 2, 1, 0, 0].each_with_index do |result, i|
        expect(subject.lines[i].to_i).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(13)
    end
  end

  context 'Part 2' do
    subject do
      Year2015::Day04.new(File.read('spec/year_2015/day_04_sample_one'))
    end

    it 'distributes cards' do
      [1, 2, 4, 8, 14, 1].each_with_index do |result, i|
        expect(subject.lines[i].quantity).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(30)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_04_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day04.new(subject, true).to_i).to eq(17803)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day04.new(subject).to_i).to eq(5554894)
    end
  end
end

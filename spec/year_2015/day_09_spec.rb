require 'year_2015/day_09'

describe Year2015::Day09 do
  context 'Part 1' do
    subject do
      Year2015::Day09.new(File.read('spec/year_2015/day_09_sample_one'), true)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(605)
    end
  end

  context 'Part 2' do
    subject do
      Year2015::Day09.new(File.read('spec/year_2015/day_09_sample_one'))
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(982)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_09_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day09.new(subject, true).to_i).to eq(117)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day09.new(subject).to_i).to eq(909)
    end
  end
end

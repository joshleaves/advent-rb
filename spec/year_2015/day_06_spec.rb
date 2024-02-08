require 'year_2015/day_06'

describe Year2015::Day06 do
  context 'Part 1' do
    subject do
      Year2015::Day06.new(File.read('spec/year_2015/day_06_sample_one'), true)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(998996)
    end
  end

  context 'Part 2' do
    subject do
      Year2015::Day06.new(File.read('spec/year_2015/day_06_sample_two'))
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(2000001)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_06_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day06.new(subject, true).to_i).to eq(400410)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day06.new(subject).to_i).to eq(15343601)
    end
  end
end

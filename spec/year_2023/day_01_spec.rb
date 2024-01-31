require 'year_2023/day_01'

describe Year2023::Day01 do
  context 'Part 1' do
    subject do
      Year2023::Day01.new(File.read('spec/year_2023/day_01_sample_one'), true)
    end

    it 'picks up the first digit' do
      expect(subject.lines[0].first_digit).to eq('1')
      expect(subject.lines[1].first_digit).to eq('3')
      expect(subject.lines[2].first_digit).to eq('1')
      expect(subject.lines[3].first_digit).to eq('7')
    end

    it 'picks up the last digit' do
      expect(subject.lines[0].last_digit).to eq('2')
      expect(subject.lines[1].last_digit).to eq('8')
      expect(subject.lines[2].last_digit).to eq('5')
      expect(subject.lines[3].last_digit).to eq('7')
    end

    it 'forms a two-digit number' do
      expect(subject.lines[0].to_i).to eq(12)
      expect(subject.lines[1].to_i).to eq(38)
      expect(subject.lines[2].to_i).to eq(15)
      expect(subject.lines[3].to_i).to eq(77)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(142)
    end
  end

  context 'Part 2' do
    subject do
      Year2023::Day01.new(File.read('spec/year_2023/day_01_sample_two'))
    end

    it 'picks up the first digit' do
      expect(subject.lines[0].first_digit).to eq('2')
      expect(subject.lines[1].first_digit).to eq('8')
      expect(subject.lines[2].first_digit).to eq('1')
      expect(subject.lines[3].first_digit).to eq('2')
      expect(subject.lines[4].first_digit).to eq('4')
      expect(subject.lines[5].first_digit).to eq('1')
      expect(subject.lines[6].first_digit).to eq('7')
    end

    it 'picks up the last digit' do
      expect(subject.lines[0].last_digit).to eq('9')
      expect(subject.lines[1].last_digit).to eq('3')
      expect(subject.lines[2].last_digit).to eq('3')
      expect(subject.lines[3].last_digit).to eq('4')
      expect(subject.lines[4].last_digit).to eq('2')
      expect(subject.lines[5].last_digit).to eq('4')
      expect(subject.lines[6].last_digit).to eq('6')
    end

    it 'forms a two-digit number' do
      expect(subject.lines[0].to_i).to eq(29)
      expect(subject.lines[1].to_i).to eq(83)
      expect(subject.lines[2].to_i).to eq(13)
      expect(subject.lines[3].to_i).to eq(24)
      expect(subject.lines[4].to_i).to eq(42)
      expect(subject.lines[5].to_i).to eq(14)
      expect(subject.lines[6].to_i).to eq(76)
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(281)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2023/day_01_input')
    end

    it 'correctly answers part 1' do
      expect(Year2023::Day01.new(subject, true).to_i).to eq(56049)
    end

    it 'correctly answers part 2' do
      expect(Year2023::Day01.new(subject).to_i).to eq(54530)
    end
  end
end

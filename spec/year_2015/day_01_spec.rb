require 'year_2015/day_01'

describe Year2015::Day01 do
  subject{ Year2015::Day01 }

  context 'Part 1' do
    it 'gives a final result' do
      {
        '(())' => 0,
        '()()' => 0,
        '(((' => 3,
        '(()(()(' => 3,
        '))(((((' => 3,
        '())' => -1,
        '))(' => -1,
        ')))' => -3,
        ')())())' => -3
      }.each do |input, result|
        expect(subject.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'Part 2' do
    it 'gives a final result' do
      {
        ')' => 1,
        '()())' => 5
      }.each do |input, result|
        expect(subject.new(input).to_i).to eq(result)
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_01_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day01.new(subject, true).to_i).to eq(138)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day01.new(subject).to_i).to eq(1771)
    end
  end
end

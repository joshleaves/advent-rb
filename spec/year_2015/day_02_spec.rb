require 'year_2015/day_02'

describe Year2015::Day02 do
  subject{ Year2015::Day02 }

  context 'Part 1' do
    it 'gives a final result' do
      {
        '2x3x4' => 58,
        '1x1x10' => 43
      }.each do |input, result|
        expect(subject.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'Part 2' do
    it 'gives a final result' do
      {
        '2x3x4' => 34,
        '1x1x10' => 14
      }.each do |input, result|
        expect(subject.new(input).to_i).to eq(result)
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_02_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day02.new(subject, true).to_i).to eq(1588178)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day02.new(subject).to_i).to eq(3783758)
    end
  end
end

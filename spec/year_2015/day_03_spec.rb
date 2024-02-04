require 'year_2015/day_03'

describe Year2015::Day03 do
  subject{ Year2015::Day03 }

  context 'Part 1' do
    it 'gives a final result' do
      {
        '>' => 2,
        '^>v<' => 4,
        '^v^v^v^v^v' => 2
      }.each do |input, result|
        expect(subject.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'Part 2' do
    it 'gives a final result' do
      {
        '^v' => 3,
        '^>v<' => 3,
        '^v^v^v^v^v' => 11
      }.each do |input, result|
        expect(subject.new(input).to_i).to eq(result)
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_03_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day03.new(subject, true).to_i).to eq(2081)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day03.new(subject).to_i).to eq(2341)
    end
  end
end

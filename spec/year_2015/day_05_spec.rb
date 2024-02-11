require 'year_2015/day_05'

describe Year2015::Day05 do
  context 'when Part 1' do
    subject(:line_class) do
      Year2015::Day05::Line
    end

    it 'finds nice lines' do
      %w(ugknbfddgicrmopn aaa).each do |input|
        expect(line_class.new(input)).to be_nice
      end
    end

    it 'finds naughty lines' do
      %w(jchzalrnumimnmhp haegwjzuvuyypxyu haegwjzuvuyypxyu).each do |input|
        expect(line_class.new(input)).not_to be_nice
      end
    end
  end

  context 'when Part 2' do
    subject(:line_class_two) do
      Year2015::Day05::LinePartTwo
    end

    it 'finds nice lines' do
      %w(qjhvhtzxzqqjkmpb xxyxx).each do |input|
        expect(line_class_two.new(input)).to be_nice
      end
    end

    it 'finds naughty lines' do
      %w(uurcxstgmygtbstg ieodomkazucvgmuy).each do |input|
        expect(line_class_two.new(input)).not_to be_nice
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_05_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(238)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(69)
    end
  end
end

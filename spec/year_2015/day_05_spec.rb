require 'year_2015/day_05'

describe Year2015::Day05 do
  context 'Part 1' do
    subject do
      Year2015::Day05::Line
    end

    it 'finds nice lines' do
      %w(ugknbfddgicrmopn aaa).each do |input|
        expect(subject.new(input).nice?).to be_truthy
      end
    end

    it 'finds naughty lines' do
      %w(jchzalrnumimnmhp haegwjzuvuyypxyu haegwjzuvuyypxyu).each do |input|
        expect(subject.new(input).nice?).to be_falsy
      end
    end
  end

  context 'Part 2' do
    subject do
      Year2015::Day05::LinePartTwo
    end

    it 'finds nice lines' do
      %w(qjhvhtzxzqqjkmpb xxyxx).each do |input|
        expect(subject.new(input).nice?).to be_truthy
      end
    end

    it 'finds naughty lines' do
      %w(uurcxstgmygtbstg ieodomkazucvgmuy).each do |input|
        expect(subject.new(input).nice?).to be_falsy
      end
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2015/day_05_input')
    end

    it 'correctly answers part 1' do
      expect(Year2015::Day05.new(subject, true).to_i).to eq(238)
    end

    it 'correctly answers part 2' do
      expect(Year2015::Day05.new(subject).to_i).to eq(69)
    end
  end
end

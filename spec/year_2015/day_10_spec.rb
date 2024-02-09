require 'year_2015/day_10'

describe Year2015::Day10 do
  context 'Part 1' do
    subject do
      Year2015::Day10.new('1')
    end

    it 'iterates each look-and-say' do
      %w(1 11 21 1211 111221 312211).each_with_index do |result, i|
        expect(subject.iterations(i)).to eq(result)
      end
    end
  end

  context 'Results' do
    subject do
      Year2015::Day10.new('1113222113')
    end

    it 'correctly answers part 1' do
      expect(subject.to_i(40)).to eq(252594)
    end

    it 'correctly answers part 2' do
      expect(subject.to_i(50)).to eq(3579328)
    end
  end
end

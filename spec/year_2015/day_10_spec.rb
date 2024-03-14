require 'year_2015/day_10'

describe Year2015::Day10 do
  context 'when Part 1' do
    it 'iterates each look-and-say' do
      %w(1 11 21 1211 111221 312211).each_with_index do |result, i|
        expect(described_class.new('1').to_s(i)).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      described_class.new('1113222113')
    end

    it 'correctly answers part 1' do
      expect(input_data.to_i(40)).to eq(252_594)
    end

    it 'correctly answers part 2' do
      expect(input_data.to_i(50)).to eq(3_579_328)
    end
  end
end

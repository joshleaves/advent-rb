require 'year_2016/day_16'

describe Year2016::Day16 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('10000', true).to_s(20)).to eq('01100')
    end
  end

  context 'when Results' do
    subject(:input_data) do
      '11100010111110100'
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_s(272)).to eq('10100011010101011')
    end

    it 'correctly answers part 2' do
      skip('Test is too slow for CI') if ENV['CI']
      expect(described_class.new(input_data).to_s(35_651_584)).to eq('01010001101011001')
    end
  end
end

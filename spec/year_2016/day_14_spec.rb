require 'year_2016/day_14'

describe Year2016::Day14 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('abc', true).to_i).to eq(22_728)
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      skip('Test is too slow for CI') if ENV['CI']

      expect(described_class.new('abc').to_i).to eq(22_551)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      'yjdafjpo'
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(25_427)
    end

    it 'correctly answers part 2' do
      skip('Test is too slow for CI') if ENV['CI']

      expect(described_class.new(input_data).to_i).to eq(22_045)
    end
  end
end

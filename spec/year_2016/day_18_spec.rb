require 'year_2016/day_18'

describe Year2016::Day18 do
  context 'when Part 1' do
    it 'gives a final result' do
      [['..^^.', 3, 6], ['.^^.^.^^^^', 10, 38]].each do |input, len, result|
        expect(described_class.new(input, true).to_i(len)).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_18_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i(40)).to eq(1926)
    end

    it 'correctly answers part 2' do
      skip('Test is too slow for CI') if ENV['CI']
      expect(described_class.new(input_data).to_i(400_000)).to eq(19_986_699)
    end
  end
end

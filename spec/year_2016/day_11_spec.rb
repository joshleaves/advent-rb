require 'year_2016/day_11'

describe Year2016::Day11 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2016/day_11_sample_one'), true)
    end

    it 'checks for safe states' do
      %w(01020 11120 22220 12120 02020 12121 22222 32323 22223 33233 23232).each do |input|
        input = input.split.map(&:to_i)
        expect(described_class).to be_state_is_safe(input)
      end
    end

    it 'gives a final result' do
      expect(sample_one.solve).to eq(11)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_11_input')
    end

    it 'correctly answers part 1' do
      skip('Test is too slow for CI') if ENV['CI']
      expect(described_class.new(input_data, true).solve).to eq(47)
    end

    it 'correctly answers part 2' do
      skip('Test is too slow for CI') if ENV['CI']

      expect(described_class.new(input_data).solve).to eq(71)
    end
  end
end

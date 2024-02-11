require 'year_2015/day_02'

describe Year2015::Day02 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        '2x3x4' => 58,
        '1x1x10' => 43
      }
    end

    it 'gives a final result' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      {
        '2x3x4' => 34,
        '1x1x10' => 14
      }
    end

    it 'gives a final result' do
      sample_two.each do |input, result|
        expect(described_class.new(input).to_i).to eq(result)
      end
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_02_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(1588178)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(3783758)
    end
  end
end

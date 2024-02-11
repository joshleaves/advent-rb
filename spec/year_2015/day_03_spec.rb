require 'year_2015/day_03'

describe Year2015::Day03 do
  subject(:sample_one) do
    {
      '>' => 2,
      '^>v<' => 4,
      '^v^v^v^v^v' => 2
    }
  end

  context 'when Part 1' do
    it 'gives a final result' do
      sample_one.each do |input, result|
        expect(described_class.new(input, true).to_i).to eq(result)
      end
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      {
        '^v' => 3,
        '^>v<' => 3,
        '^v^v^v^v^v' => 11
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
      File.read('spec/year_2015/day_03_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(2081)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(2341)
    end
  end
end

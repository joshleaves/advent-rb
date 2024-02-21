require 'year_2016/day_01'

describe Year2016::Day01 do
  context 'when Part 1' do
    subject(:sample_one) do
      {
        'R2, L3' => 5,
        'R2, R2, R2' => 2,
        'R5, L5, R5, R3' => 12
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
        'R8, R4, R4, R8' => 4
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
      File.read('spec/year_2016/day_01_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(146)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(131)
    end
  end
end

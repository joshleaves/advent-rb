require 'year_2016/day_08'

describe Year2016::Day08 do
  context 'when Part 1' do
    subject(:sample_one) do
      File.read('spec/year_2016/day_08_sample_one')
    end

    it 'gives a final result' do
      expect(described_class.new(sample_one).to_i).to eq(6)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_08_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).to_i).to eq(106)
    end
  end
end

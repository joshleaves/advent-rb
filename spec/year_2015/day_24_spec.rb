require 'year_2015/day_24'

describe Year2015::Day24 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_24_sample_one'), true)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(99)
    end
  end

  context 'when Part 2' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_24_sample_one'))
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(44)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_24_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(10_439_961_859)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(72_050_269)
    end
  end
end

require 'year_2016/day_06'

describe Year2016::Day06 do
  subject(:sample_one) do
    File.read('spec/year_2016/day_06_sample_one')
  end

  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new(sample_one, true).code).to eq('easter')
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      expect(described_class.new(sample_one).code).to eq('advent')
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_06_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).code).to eq('zcreqgiv')
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).code).to eq('pljvorrk')
    end
  end
end

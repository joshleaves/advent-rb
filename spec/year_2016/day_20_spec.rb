require 'year_2016/day_20'

describe Year2016::Day20 do
  subject(:sample_data) do
    "5-8\n0-2\n4-7"
  end

  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new(sample_data).solve_v1).to eq(3)
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      expect(described_class.new(sample_data).solve_v2(9)).to eq(2)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_20_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).solve_v1).to eq(4_793_564)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).solve_v2).to eq(146)
    end
  end
end

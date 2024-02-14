require 'year_2015/day_19'

describe Year2015::Day19 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2015/day_19_sample_one'), true)
    end

    it 'calculates all permutations' do
      expect(sample_one.permutations).to eq(%w(HOOH HOHO OHOH HHHH).sort)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(4)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2015/day_19_sample_two'))
    end

    it 'gives a final result' do
      expect(sample_two.build_molecule).to eq(5)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2015/day_19_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(576)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).build_molecule).to eq(207)
    end
  end
end

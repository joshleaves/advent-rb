require 'year_2015/day_20'

describe Year2015::Day20 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new(1, 150, true).to_i).to eq(8)
    end
  end

  context 'when Results' do
    it 'correctly answers part 1' do
      expect(described_class.new(831000, 36000000, true).to_i).to eq(831600)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(884000, 36000000).to_i).to eq(884520)
    end
  end
end

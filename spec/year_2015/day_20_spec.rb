require 'year_2015/day_20'

describe Year2015::Day20 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new(1, 150, true).to_i).to eq(8)
    end
  end

  context 'when Results' do
    it 'correctly answers part 1' do
      expect(described_class.new(831_000, 36_000_000, true).to_i).to eq(831_600)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(884_000, 36_000_000).to_i).to eq(884_520)
    end
  end
end

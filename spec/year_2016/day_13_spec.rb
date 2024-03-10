require 'year_2016/day_13'

describe Year2016::Day13 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(10, 7, 4, true)
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(11)
    end
  end

  context 'when Results' do
    it 'correctly answers part 1' do
      expect(described_class.new(1_352, 31, 39, true).to_i).to eq(90)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(1_352, 31, 39).to_i).to eq(135)
    end
  end
end

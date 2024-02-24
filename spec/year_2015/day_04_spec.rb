require 'year_2015/day_04'

describe Year2015::Day04 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('abcdef', true).to_i).to eq(609_043)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      'iwrupvqb'
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(346_386)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(9_958_218)
    end
  end
end

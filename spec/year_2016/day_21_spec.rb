require 'year_2016/day_21'

describe Year2016::Day21 do
  context 'when Part 1' do
    subject(:sample_one) do
      <<~HEREDOC
        swap position 4 with position 0
        swap letter d with letter b
        reverse positions 0 through 4
        rotate left 1 step
        move position 1 to position 4
        move position 3 to position 0
        rotate based on position of letter b
        rotate based on position of letter d
      HEREDOC
    end

    it 'gives a final result' do
      expect(described_class.new(sample_one, true).solve('abcde')).to eq('decab')
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_21_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).solve('abcdefgh')).to eq('gfdhebac')
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).solve('fbgdceah')).to eq('dhaegfbc')
    end
  end
end

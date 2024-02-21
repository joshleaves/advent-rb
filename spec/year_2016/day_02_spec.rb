require 'year_2016/day_02'

describe Year2016::Day02 do
  subject(:sample) do
    <<~HEREDOC
      ULL
      RRDDD
      LURDL
      UUUUD
    HEREDOC
  end

  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new(sample, true).code).to eq('1985')
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      expect(described_class.new(sample).code).to eq('5DB3')
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_02_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).code).to eq('45973')
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).code).to eq('27CA4')
    end
  end
end

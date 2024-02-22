require 'year_2016/day_05'

describe Year2016::Day05 do
  context 'when Part 1' do
    it 'gives a final result' do
      expect(described_class.new('abc', true).code).to eq('18f47a30')
    end
  end

  context 'when Part 2' do
    it 'gives a final result' do
      expect(described_class.new('abc').code).to eq('05ace8e3')
    end
  end

  context 'when Results' do
    subject(:input_data) do
      'ojvtpuvg'
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).code).to eq('4543c154')
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).code).to eq('1050cbbd')
    end
  end
end

require 'year_2015/day_11'

describe Year2015::Day11 do
  context 'when Part 1' do
    subject(:password_class) do
      described_class::Password
    end

    it 'checks first criteria (three straight letters)' do
      expect(password_class.new('hijklmmn')).to be_first_criteria
      expect(password_class.new('abbceffg')).not_to be_first_criteria
      expect(password_class.new('abbcegjk')).not_to be_first_criteria
    end

    it 'checks second criteria (no i/o/l)' do
      expect(password_class.new('hijklmmn')).not_to be_second_criteria
      expect(password_class.new('abbceffg')).to be_second_criteria
      expect(password_class.new('abbcegjk')).to be_second_criteria
    end

    it 'checks third criteria (two different pairs)' do
      expect(password_class.new('hijklmmn')).not_to be_third_criteria
      expect(password_class.new('abbceffg')).to be_third_criteria
      expect(password_class.new('abbcegjk')).not_to be_third_criteria
    end

    it 'gives a final result' do
      { 'abcdefgh' => 'abcdffaa', 'ghijklmn' => 'ghjaabcc' }.each do |input, result|
        expect(described_class.new(input).to_s).to eq(result)
      end
    end
  end

  context 'when Results' do
    it 'correctly answers part 1' do
      expect(described_class.new('vzbxkghb').to_s).to eq('vzbxxyzz')
    end

    it 'correctly answers part 2' do
      expect(described_class.new('vzbxxyzz').to_s).to eq('vzcaabcc')
    end
  end
end

require 'year_2015/day_11'

describe Year2015::Day11 do
  context 'Part 1' do
    subject do
      Year2015::Day11
    end

    it 'checks first criteria (three straight letters)' do
      expect(subject::Password.new('hijklmmn').first_criteria?).to be_truthy
      expect(subject::Password.new('abbceffg').first_criteria?).to be_falsey
      expect(subject::Password.new('abbcegjk').first_criteria?).to be_falsey
    end

    it 'checks second criteria (no i/o/l)' do
      expect(subject::Password.new('hijklmmn').second_criteria?).to be_falsey
      expect(subject::Password.new('abbceffg').second_criteria?).to be_truthy
      expect(subject::Password.new('abbcegjk').second_criteria?).to be_truthy
    end

    it 'checks third criteria (two different pairs)' do
      expect(subject::Password.new('hijklmmn').third_criteria?).to be_falsey
      expect(subject::Password.new('abbceffg').third_criteria?).to be_truthy
      expect(subject::Password.new('abbcegjk').third_criteria?).to be_falsey
    end

    it 'gives a final result' do
      expect(subject.new('abcdefgh').to_s).to eq('abcdffaa')
      expect(subject.new('ghijklmn').to_s).to eq('ghjaabcc')
    end
  end

  context 'Results' do
    it 'correctly answers part 1' do
      expect(described_class.new('vzbxkghb').to_s).to eq('vzbxxyzz')
    end

    it 'correctly answers part 2' do
      expect(described_class.new('vzbxxyzz').to_s).to eq('vzcaabcc')
    end
  end
end

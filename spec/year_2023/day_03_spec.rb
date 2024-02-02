require 'year_2023/day_03'

describe Year2023::Day03 do
  context 'Part 1' do
    subject do
      Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one'), true)
    end

    it 'cleans up non-connected number parts' do
      expect(subject.lines[0].line).to eq('467.......')
      expect(subject.lines[5].line).to eq('.....+....')
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(4361)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-bis'), true).to_i).to eq(413)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-ter'), true).to_i).to eq(925)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-quad'), true).to_i).to eq(0)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-five'), true).to_i).to eq(4)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-six'), true).to_i).to eq(156)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-seven'), true).to_i).to eq(62)
    end
  end

  context 'Part 2' do
    subject do
      Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_two'))
    end

    it 'cleans up non-connected number parts' do
      expect(subject.lines[0].line).to eq('467.......')
      expect(subject.lines[5].line).to eq('.....+....')
    end

    it 'gives a final result' do
      expect(subject.to_i).to eq(467835)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-bis')).to_i).to eq(6756)
      expect(Year2023::Day03.new(File.read('spec/year_2023/day_03_sample_one-ter')).to_i).to eq(6756)
    end
  end

  context 'Results' do
    subject do
      File.read('spec/year_2023/day_03_input')
    end

    it 'correctly answers part 1' do
      expect(Year2023::Day03.new(subject, true).to_i).to eq(540212)
    end

    it 'correctly answers part 2' do
      # expect(Year2023::Day03.new(subject).to_i).to eq(87605697)
    end
  end
end

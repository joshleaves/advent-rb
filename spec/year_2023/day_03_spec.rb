require 'year_2023/day_03'

describe Year2023::Day03 do
  subject(:clean_lines) do
    {
      0 => '467.......',
      5 => '.....+....'
    }
  end

  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2023/day_03_sample_one'), true)
    end

    it 'cleans up non-connected number parts' do
      clean_lines.each do |idx, line|
        expect(sample_one.lines[idx].line).to eq(line)
      end
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(4361)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-bis'), true).to_i).to eq(413)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-ter'), true).to_i).to eq(925)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-quad'), true).to_i).to eq(0)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-five'), true).to_i).to eq(4)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-six'), true).to_i).to eq(156)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-seven'), true).to_i).to eq(62)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2023/day_03_sample_two'))
    end

    it 'cleans up non-connected number parts' do
      clean_lines.each do |idx, line|
        expect(sample_two.lines[idx].line).to eq(line)
      end
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(467835)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-bis')).to_i).to eq(6756)
      # expect(described_class.new(File.read('spec/year_2023/day_03_sample_one-ter')).to_i).to eq(6756)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2023/day_03_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(540212)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(87605697)
    end
  end
end

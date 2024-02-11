require 'year_2023/day_01'

describe Year2023::Day01 do
  context 'when Part 1' do
    subject(:sample_one) do
      described_class.new(File.read('spec/year_2023/day_01_sample_one'), true)
    end

    it 'picks up the first digit' do
      %w(1 3 1 7).each_with_index do |result, idx|
        expect(sample_one.lines[idx].first_digit).to eq(result)
      end
    end

    it 'picks up the last digit' do
      %w(2 8 5 7).each_with_index do |result, idx|
        expect(sample_one.lines[idx].last_digit).to eq(result)
      end
    end

    it 'forms a two-digit number' do
      [12, 38, 15, 77].each_with_index do |result, idx|
        expect(sample_one.lines[idx].to_i).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(sample_one.to_i).to eq(142)
    end
  end

  context 'when Part 2' do
    subject(:sample_two) do
      described_class.new(File.read('spec/year_2023/day_01_sample_two'))
    end

    it 'picks up the first digit' do
      %w(2 8 1 2 4 1 7).each_with_index do |result, idx|
        expect(sample_two.lines[idx].first_digit).to eq(result)
      end
    end

    it 'picks up the last digit' do
      %w(9 3 3 4 2 4 6).each_with_index do |result, idx|
        expect(sample_two.lines[idx].last_digit).to eq(result)
      end
    end

    it 'forms a two-digit number' do
      [29, 83, 13, 24, 42, 14, 76].each_with_index do |result, idx|
        expect(sample_two.lines[idx].to_i).to eq(result)
      end
    end

    it 'gives a final result' do
      expect(sample_two.to_i).to eq(281)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2023/day_01_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(56049)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(54530)
    end
  end
end

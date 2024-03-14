require 'year_2016/day_23'

describe Year2016::Day23 do
  context 'when Part 1' do
    subject(:sample_one) do
      sample_data = <<~HEREDOC
        cpy 2 a
        tgl a
        tgl a
        tgl a
        cpy 1 a
        dec a
        dec a
      HEREDOC
      described_class.new(sample_data).program
    end

    it 'gives a final result' do
      sample_one.execute
      expect(sample_one.registers['a']).to eq(3)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_23_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).part_one).to eq(13_776)
    end

    it 'correctly answers part 2' do
      skip('Test is too slow for CI') if ENV['CI']

      expect(described_class.new(input_data).part_two).to eq(479_010_336)
    end
  end
end

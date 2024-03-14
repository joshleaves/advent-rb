require 'year_2016/day_24'

describe Year2016::Day24 do
  context 'when Part 1' do
    subject(:sample_one) do
      <<~HEREDOC
        ###########
        #0.1.....2#
        #.#######.#
        #4.......3#
        ###########
      HEREDOC
    end

    it 'gives a final result' do
      expect(described_class.new(sample_one, true).to_i).to eq(14)
    end
  end

  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_24_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data, true).to_i).to eq(430)
    end

    it 'correctly answers part 2' do
      expect(described_class.new(input_data).to_i).to eq(700)
    end
  end
end

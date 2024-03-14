require 'year_2016/day_25'

describe Year2016::Day25 do
  context 'when Results' do
    subject(:input_data) do
      File.read('spec/year_2016/day_25_input')
    end

    it 'correctly answers part 1' do
      expect(described_class.new(input_data).to_i).to eq(192)
    end
  end
end
